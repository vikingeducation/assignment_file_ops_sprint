
require 'dictionary_ui'

describe DictionaryUI do

  let(:listener) { double("listener") }
  let(:renderer) { double("renderer") }
  let(:saver)    { double("saver") }
  let(:searcher) { double("searcher") }

  let(:dictionary_ui) do
    args = { listener: listener, renderer: renderer,
             saver: saver, searcher: searcher }
    DictionaryUI.new(args)
  end

  describe '#initialize' do
    #it 'raises KeyError unless passed a listener' do
      #args = { renderer: "", searcher: "", saver: "" }
      #expect{DictionaryUI.new(args)}.to raise_error(KeyError)
    #end

    #it 'raises KeyError unless passed a renderer' do
      #args = { searcher: "", saver: "", listener: "" }
      #expect{DictionaryUI.new(args)}.to raise_error(KeyError)
    #end

    #it 'raises KeyError unless passed a saver' do
      #args = { renderer: "", searcher: "", listener: "" }
      #expect{DictionaryUI.new(args)}.to raise_error(KeyError)
    #end

    #it 'raises KeyError unless passed a searcher' do
      #args = {renderer: "", saver: "", listener: ""}
      #expect{DictionaryUI.new(args)}.to raise_error(KeyError)
    #end
  end

  describe '#welcome' do
    it 'outputs a welcome message' do
      welcome_message = "Welcome"
      expect(renderer).to receive(:render).with(welcome_message)
      dictionary_ui.welcome(welcome_message)
    end
  end

  describe '#prompt_user_for_dictionary' do
    it 'prompts user for input path' do
      prompt = "Where's your dictionary"
      expect(renderer).to receive(:render).with(prompt)
      # expect listner to get formatted input
      dictionary_ui.prompt_user_for_dictionary(prompt)
    end
  end

end
