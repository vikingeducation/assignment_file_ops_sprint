require 'rspec'
require 'dictionary_loader'

describe DictionaryLoader do

  let(:words) { %w{one, two, three}}

  let(:dictionary) { DictionaryLoader.new(words) }

  describe "#new" do
    it "takes a file as an argument" do
      expect{dictionary}.not_to raise_error
    end

    it "saves the file path to :file_path"
  end

  describe "#load_dict" do

    it "takes a file as an argument" do
    end
    it "raises an ArgumentError if it does not receive a file"
    it "it loads each line of the file into :words"

  end

end