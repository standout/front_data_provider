# FrontDataResponse
class FrontDataResponse
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def expires_at
    Time.now + 120
  end
end
