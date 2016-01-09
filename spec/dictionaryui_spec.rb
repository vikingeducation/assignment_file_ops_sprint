require 'dictionaryui'

describe DictionaryUI do

  let(:d){DictionaryUI.new}

  it 'should be an instance of DictionaryUI' do
    expect(subject).to be_a(DictionaryUI)
  end

  #run method
  describe '#run' do
    # It prompts user for an input.
    # Not really needed
    it "d receives quit?" do
      allow(d).to receive(:gets).and_return("5desk.txt")
      allow(d).to receive(:quit?).with('q').and_return(false)
      expect(d).to receive(:quit?)
      d.run
    end
  end

  describe '#quit?' do
    it "returns true if response == 'q'" do
      expect(d.quit?('q')).to eq(true)
    end

    it "returns false if response == 'x'" do
      expect(d.quit?('x')).to eq(false)
    end
  end

end

