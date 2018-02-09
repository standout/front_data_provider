RSpec.describe FrontDataResponse do
  it 'sets a reasonable expire time' do
    response = FrontDataResponse.new([])
    expect(response.expires_at).to be_between Time.now + 30, Time.now + 180
  end
end
