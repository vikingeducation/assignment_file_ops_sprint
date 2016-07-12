require_relative 'spec_helper'
require 'dictionary_searcher'
require 'dictionary'

describe DictionarySearcher do

  let (:d) {DictionarySearcher.new }

  describe '#search' do
    it 'listens to' do
    end
  end

  describe '#exact' do


    it 'returns the exact words of an array(and not partly)' do
      test_arr = double('Dictionary', :words => ["sdfsf", "jivoj", "hello", "hellosir"])
      expect(d.exact(test_arr, "hello")).to eq(["hello"])
    end



  end
end