RSpec.describe FrontDataProvider do
  it 'stores a token' do
    p = FrontDataProvider.new(token: 'foregone.olio.stagnate')
    expect(p.options[:token]).to eq('foregone.olio.stagnate')
  end

  describe '#unassigned' do
    it 'is a number type' do
      p = FrontDataProvider.new()
      expect(p.unassigned[:type]).to eq 'number'
    end

#    it 'fetches number of unassigned tickets' do
#      p = FrontDataProvider.new(token: 'abc')
#      expect(p.unassigned).to eq '23'
#    end
  end
end
