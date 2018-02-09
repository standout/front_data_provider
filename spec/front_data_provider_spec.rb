RSpec.describe FrontDataProvider do
  it 'stores a token' do
    p = FrontDataProvider.new(token: 'foregone.olio.stagnate')
    expect(p.options[:token]).to eq('foregone.olio.stagnate')
  end

  describe '#unassigned' do
    it 'is a number type' do
      p = FrontDataProvider.new(token: 'correct.token')
      expect(p.unassigned[:type]).to eq 'number'
    end

    it 'fetches number of unassigned tickets' do
      p = FrontDataProvider.new(token: 'correct.token')
      expect(p.unassigned[:data]).to eq 3
    end

    it 'handles front errors' do
      p = FrontDataProvider.new(token: 'erroneous.token')
      expect(p.unassigned[:type]).to eq 'text'
    end
  end

  describe '#assigned' do
    it 'displays names of people with open tickets' do
      p = FrontDataProvider.new(token: 'correct.token')
      expect(p.assigned[:type]).to eq 'table'
      expect(p.assigned[:data]).to eq [['Leela Turanga', 2], ['David Elbe', 1]]
    end
  end
end
