# spec/dictionary_searcher_spec.rb

require 'dictionary_searcher'

describe "DictionarySearcher" do
  context "object instantiation" do
    describe ".new" do
      it "creates an instance of DictionarySearcher" do
        expect(DictionarySearcher.new).to be_a(DictionarySearcher)
      end

      it "takes one argument" do
        expect { DictionarySearcher.new("my argument") }.not_to raise_error
      end

      it "raises an error if more than one argument is provided" do
        expect { DictionarySearcher.new("argument 1", "argument 2") }.to raise_error(ArgumentError)
      end
    end

    describe "#initialize" do
      it "sets @dictionary to the provided argument" do
        string = "dictionary"
        expect(DictionarySearcher.new(string).dictionary).to eq(string)
      end
    end
  end

  context "instance variables" do
    it "does not allow the dictionary to be modified after initialization" do
      expect { DictionarySearcher.new.dictionary = "new dictionary" }.to raise_error(NoMethodError)
    end

    it "allows @dictionary to be read" do
      argument = "blah"
      ds = DictionarySearcher.new(argument)
      expect(ds.dictionary).to eq(argument)
    end
  end

  context "searching for words in the dictionary" do
    let(:dictionary) { instance_double("Dictionary", words: ["aardvark", "bonobo", "cheetah", "fox", "foxfire", "foxglove", "foxhole", "outfox"]) }
    let(:ds) { DictionarySearcher.new(dictionary) }

    describe "#exact_matches" do
      it "returns the list of words that exactly match the search term" do
        expect(ds.exact_matches("aardvark")).to eq(["aardvark"])
        expect(ds.exact_matches("cheetah")).to eq(["cheetah"])
      end
    end

    describe "#partial_matches" do
      it "returns the list of words that partially match the search term" do
        expect(ds.partial_matches("fox")).to eq(["fox", "foxfire", "foxglove", "foxhole", "outfox"])
      end
    end

    describe "#begins_with_matches" do
      it "returns the list of words that begin with the search term" do
        matches = ds.begins_with_matches("fox")

        expect(matches).to eq(["fox", "foxfire", "foxglove", "foxhole"])
        expect(matches).not_to include("outfox")
      end
    end

    describe "#ends_with_matches" do
      it "returns the list of words that end with the search term" do
        matches = ds.ends_with_matches("fox")

        expect(matches).to eq(["fox", "outfox"])
        expect(matches).not_to include("foxfire", "foxglove", "foxhole")
      end
    end

    describe "#run_search" do
      it "runs the appropriate search with the provided search term" do
        search_term = "blah"

        expect(ds).to receive(:exact_matches).with(search_term)
        ds.run_search("1", search_term)

        expect(ds).to receive(:partial_matches).with(search_term)
        ds.run_search("2", search_term)

        expect(ds).to receive(:begins_with_matches).with(search_term)
        ds.run_search("3", search_term)

        expect(ds).to receive(:ends_with_matches).with(search_term)
        ds.run_search("4", search_term)
      end
    end
  end

  context "displaying search results" do
    let(:dictionary) { instance_double("Dictionary", words: ["aardvark", "bonobo", "cheetah", "fox", "foxfire", "foxglove", "foxhole", "outfox"]) }
    let(:ds) { DictionarySearcher.new(dictionary) }

    describe "#display_results" do
      it "displays the number of search results" do
        matches = ds.exact_matches("aardvark")
        expect { ds.display_results(matches) }.to output(/Found 1 matches/).to_stdout

        matches = ds.partial_matches("fox")
        expect { ds.display_results(matches) }.to output(/Found 5 matches/).to_stdout

        matches = ds.begins_with_matches("fox")
        expect { ds.display_results(matches) }.to output(/Found 4 matches/).to_stdout

        matches = ds.ends_with_matches("fox")
        expect { ds.display_results(matches) }.to output(/Found 2 matches/).to_stdout
      end

      it "displays the whole list of search results" do
        matches = ds.exact_matches("aardvark")
        expect { ds.display_results(matches) }.to output(/aardvark\n/).to_stdout

        matches = ds.partial_matches("fox")
        expect { ds.display_results(matches) }.to output(/fox\nfoxfire\nfoxglove\nfoxhole\noutfox\n/).to_stdout

        matches = ds.begins_with_matches("fox")
        expect { ds.display_results(matches) }.to output(/fox\nfoxfire\nfoxglove\nfoxhole\n/).to_stdout

        matches = ds.ends_with_matches("fox")
        expect { ds.display_results(matches) }.to output(/fox\noutfox\n/).to_stdout
      end
    end
  end
end