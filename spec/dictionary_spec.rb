require 'dictionary'
require 'dictionary_loader'

describe Dictionary do

  let(:fake_dict) { ["words", "more words", "owls"] }

  describe "#initialize" do

    it "returns a dictionary with the correct words" do
      expect(Dictionary.new(fake_dict).words).to eq(fake_dict)
    end

  end
end
