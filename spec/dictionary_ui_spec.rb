# require 'dictionary_ui'

# describe DictionaryUI do

#   let(:dictionary_ui) { DictionaryUI.new }

#   describe '#initialize' do

#     it 'starts with a blank dictionary path' do
#       expect(dictionary_ui.path).to be_nil
#     end

#   end

#   describe '#run' do

#     it 'calls #get_path' do
#       allow(dictionary_ui).to receive(:get_path).and_return(nil)
#       dictionary_ui.run
#     end

#   end

#   describe '#get_path' do

#     it 'assigns a path' do
#       allow(dictionary_ui).to receive(:gets).and_return("path")
#       dictionary_ui.get_path
#       expect(dictionary_ui.path).to eq("path")
#     end

#   end

# end
