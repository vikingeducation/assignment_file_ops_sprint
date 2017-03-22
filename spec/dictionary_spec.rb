# spec/dictionary_spec.rb

require 'dictionary'

describe "Dictionary" do
  let(:words) { ["aardvark", "bonobo", "cheetah"]}
  let(:dict) { Dictionary.new(words) }

  describe "#initialize" do
    it "sets @words to the provided argument" do
      expect(dict.words).to eq(words)
    end
  end

  describe ".new" do
    it "takes one argument" do
      # this seems to always pass..?
      # expect(Dictionary).to respond_to(:new).with(1).argument

      expect { Dictionary.new(words) }.not_to raise_error
    end

    it "raises an error for any other number of arguments" do
      expect { Dictionary.new }.to raise_error(ArgumentError)
      expect { Dictionary.new(words, words) }.to raise_error(ArgumentError)
    end
  end

  context "instance variables" do
    it "does not allow @words to be modified after object instantiation" do
      expect { dict.words = "blah" }.to raise_error(NoMethodError)
    end

    it "allows @words to be read" do
      expect { dict.words }.not_to raise_error
    end
  end

  describe "#word_count" do
    it "returns the number of words in the dictionary" do
      expect(dict.word_count).to eq(3)
    end
  end

  describe "#word_frequency" do
    it "returns the frequency of words in the dictionary by starting letter" do
      word_frequency = dict.word_frequency
      ("a".."c").each do |key|
        expect(word_frequency.has_key?(key)).to be true
        expect(word_frequency[key]).to eq(1)
      end
    end
  end
end