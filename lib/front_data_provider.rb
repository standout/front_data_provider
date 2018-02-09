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
    [unassigned, assigned]
  end

  def unassigned
    {
      type: 'number',
      title: 'Nya supportärenden',
      data: fetcher.unassigned
    }
  rescue => e
    {
      type: 'text',
      title: 'Nya supportärenden',
      data: e.inspect
    }
  end

  def assigned
    {
      type: 'table',
      title: 'Pågående supportärenden',
      meta: {
        headers: ['Namn', 'Antal']
      },
      data: fetcher.assigned
    }
  end
end
