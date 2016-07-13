require 'dictionaryui'

describe DictionaryUI do
  describe '#run' do
    it "prompts user for path" do
      allow(subject).to receive(:gets).and_return('./5desk.txt')
      expect(subject.run).to eq('./5desk.txt')
    end
  end

end
