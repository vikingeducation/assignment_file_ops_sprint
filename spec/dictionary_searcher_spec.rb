require 'dictionary_searcher'
require 'dictionary'

describe "DictionarySearcher" do
  let(:d){ instance_double(Dictionary, :entries => ['anteater', 'antebellum', 'antarctic', 'anchovies', 'handkerchieves', 'thieves', 'jubilation', 'mutilation'])}
  let(:s){ DictionarySearcher.new(d)}

  describe '#initialize' do
    it 'accepts and stores dictionary entries' do
      expect(s.instance_variable_get(:@entries)).not_to be_nil
    end
  end

  describe '#term(=)' do
    it 'term may be set from the outside' do
      expect{s.term = 'ant'}.not_to raise_error
    end
    it 'stores a term' do
      s.term = 'antsy'
      expect(s.term).to eq('antsy')
    end
  end

  describe '#exact' do
    before { s.term = 'anteater'}

    it 'returns an array' do
      expect(s.exact).to be_a(Array)
    end

    it 'returns an array of size 1' do
      expect(s.exact.size).to eq(1)
    end

  end

  describe '#partial' do
    before { s.term = 'ev'}

    it 'returns an array' do
      expect(s.partial).to be_a(Array)
    end

    it 'returns the correct results' do
      expect(s.partial).to eq(['handkerchieves', 'thieves'])
    end
  end

  describe '#begins_with' do
    before { s.term = 'an'}

    it 'returns an array' do
      expect(s.begins_with).to be_a(Array)
    end
    it 'returns the correct results' do
      expect(s.begins_with).to eq(['anteater', 'antebellum', 'antarctic', 'anchovies'])
    end
  end

  describe '#ends_with' do
    before { s.term = 'ation'}

    it 'returns an array' do
      expect(s.ends_with).to be_a(Array)
    end

    it 'returns the correct results' do
      expect(s.ends_with).to eq(['jubilation', 'mutilation'])
    end
  end

end
