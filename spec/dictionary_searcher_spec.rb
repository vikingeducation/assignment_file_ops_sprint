require_relative 'spec_helper'
require 'dictionary_searcher'
require 'dictionary'

describe DictionarySearcher do

  let (:d) { DictionarySearcher.new }
  let (:test_arr) do 
    double('Dictionary', :words => %w(koreanbbq thesaurus thereafter americanbbq hahaheyho lmao wtf bbq itsdatboi they theresee hello northkoreanbbq fisheyes hellosir think chinesebbq heya).sort)
  end


  describe '#search' do
    it 'calls other methods' do
      expect(d).to receive(:exact).with(test_arr, "itsdatboi")
      d.search(test_arr, "itsdatboi", "exact")
    end
  end

  describe '#exact' do


    it 'returns the exact words of an array(and not partly)' do
      expect(d.exact(test_arr, "hello")).to eq(["hello"])
    end
  end

  describe '#begins' do 
    it "returns items that begin with the search keyword" do
      expect(d.begins(test_arr, "the")).to eq(%w(thesaurus thereafter theresee they).sort)
    end
  end

  describe '#ends' do 
    it "returns items that ends with the search keyword" do
      expect(d.ends(test_arr, "bbq")).to eq(%w(koreanbbq americanbbq bbq northkoreanbbq chinesebbq).sort)
    end
  end

  describe '#partial' do
    it 'returns items that contains the search keyword' do
      expect(d.partial(test_arr, "hey")).to eq(%w(hahaheyho fisheyes heya they).sort)
    end

  end

end