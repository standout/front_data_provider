require 'front_data_provider/response'
require 'front_data_provider/fetcher'
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
