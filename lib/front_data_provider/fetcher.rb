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

  def assigned
    res = self.class.get('/conversations?q[statuses][]=assigned', headers: headers)
    json = JSON.parse(res)
    people = json.dig('_results').collect{ |r|
      assignee = r.dig('assignee')
      [assignee['first_name'], assignee['last_name']].join(' ')
    }
    counters = people.each_with_object(Hash.new(0)) { |person, counts| counts[person] += 1 }
    counters.collect{ |key, value| [key, value] }
  end
end
