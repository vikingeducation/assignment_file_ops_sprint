require 'rspec'
require 'dictionary'

describe Dictionary do

  let(:dict) { Dictionary.new}
  describe "#new" do
    it "starts with a default dictionary" do
      expect{dict}.not_to raise_error
      expect(words).not_to be_nil
    end
    it "takes a file name or array as the first argument"
  end
end