# Fetch the data from FrontApp API
require 'httparty'
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
    json = JSON.parse(res)
    json.dig('_results').size.to_i
  end
end
