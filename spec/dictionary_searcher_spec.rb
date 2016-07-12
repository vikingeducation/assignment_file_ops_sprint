require_relative 'spec_helper'
require 'dictionary_searcher'
require 'dictionary'

describe DictionarySearcher do

  let (:d) {DictionarySearcher.new }
  let (:test_arr) do 
    double('Dictionary', :words => %w(thesaurus thereafter hahaheyho lmao wtf bbq itsdatboi theresee hello hellosir think))
  end
  describe '#search' do
    it 'listens to' do
    end
  end

  describe '#exact' do


    it 'returns the exact words of an array(and not partly)' do
      expect(d.exact(test_arr, "hello")).to eq(["hello"])
    end
  end

  describe "#begins" do 
    it "returns items that begin with the search keyword" do
      expect(d.begins(test_arr, "the")).to eq(%w(thesaurus thereafter theresee))

    end
  end
end