RSpec.describe FrontDataProvider do
  it 'stores a token' do
    p = FrontDataProvider.new(token: 'foregone.olio.stagnate')
    expect(p.options[:token]).to eq('foregone.olio.stagnate')
  end

  describe '#unassigned' do
    it 'is a number type' do
      stub_requests
      p = FrontDataProvider.new(token: 'correct.token')
      expect(p.unassigned[:type]).to eq 'number'
    end

    #    it 'fetches number of unassigned tickets' do
    #      p = FrontDataProvider.new(token: 'abc')
    #      expect(p.unassigned).to eq '23'
    #    end

    it 'handles front errors' do
      stub_requests
      p = FrontDataProvider.new(token: 'erroneous.token')
      expect(p.unassigned[:type]).to eq 'text'
    end

    def stub_requests
      stub_request(:get, 'https://api2.frontapp.com/conversations?q%5Bstatuses%5D%5B0%5D=unassigned')
        .with(headers: {
                'Accept' => 'application/json',
                'Authorization' => 'Bearer erroneous.token'
              })
        .to_return(status: 401, body: '', headers: {})

      stub_request(:get, 'https://api2.frontapp.com/conversations?q%5Bstatuses%5D%5B0%5D=unassigned')
        .with(headers: {
                'Accept' => 'application/json',
                'Authorization' => 'Bearer correct.token'
              })
        .to_return(status: 200, body: File.read(File.dirname(__FILE__) + '/results.json'))
    end


  end
end
