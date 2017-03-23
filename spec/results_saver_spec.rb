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
    it "writes the search results to the specified file" do
      filename = "test.txt"
      test_text = ["Line 1", "Line 2", "Line 3"]

      # stubs
      allow(File).to receive(:open)
      allow(File).to receive(:write)

      expect(File).to receive(:open).with(filename, 'w')

      rs.save_to_file(filename, test_text)
    end
  end
end