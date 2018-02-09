require 'front_data_provider/response'
require 'httparty'
# Front Data Provider
class FrontDataProvider
  attr_reader :options, :response

  Response = Struct.new(:data, :expiration)

  def initialize(options = {})
    @options = options
  end

  def fetch
    FrontDataResponse.new(data)
  end

  def fetcher
    @fetcher ||= FrontDataFetcher.new(options[:token])
  end

  def data
    [unassigned]
  end

  def unassigned
    {
      type: 'number',
      title: 'Nya supportärenden',
      data: fetcher.unassigned
    }
  rescue
    {
      type: 'text',
      title: 'Nya supportärenden',
      data: "Kunde inte hämta supportärenden från Front."
    }
  end
end

class FrontDataFetcher
  include HTTParty
  base_uri 'https://api2.frontapp.com'
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def headers
    { 'Authorization': "Bearer #{token}", 'Accept': 'application/json' }
  end

  def unassigned
    res = self.class.get('/conversations?q[statuses][]=unassigned', headers: headers)
    res['_results'].size.to_i
  end
end
