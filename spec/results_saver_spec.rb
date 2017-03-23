# spec/results_saver_spec.rb

require 'results_saver'

describe "ResultsSaver" do
  let(:rs) { ResultsSaver.new }

  describe "#initialize" do
    it "creates an instance of ResultsSaver" do
      expect(rs).to be_a(ResultsSaver)
    end
  end

  describe "#save_to_file" do
    it "writes the specified data to the specified file"
  end
end