# require 'dictionary'

# context Dictionary do

#   let(:loader) { class_double("DictionaryLoader", :open => "stuff") }

#   it "should prompt the user for filename to load" do
#     allow(subject).to receive(:puts)
#     expect(subject).to receive(:gets) { "filename" }
#     expect(loader).to receieve(:open) { "stuff "}
#     subject.main_loop
#   end
  
# end