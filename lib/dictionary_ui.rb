
require_relative 'dictionary_searcher'
require_relative 'dictionary_loader'
require_relative 'ui_listener'
require_relative 'ui_renderer'
require_relative 'results_saver'

class DictionaryUI

  def initialize(args = {})
    @listener = args[:listener] || UIListener
    @loader   = args[:loader]   || DictionaryLoader.new
    @renderer = args[:renderer] || UIRenderer
    @saver    = args[:saver]    || ResultsSaver
    @searcher = args[:searcher] || DictionarySearcher.new
  end

  def run
    welcome

    begin
      path = prompt_for_dictionary
    end until dictionary = loader.load(path)

    searcher.dictionary = dictionary

    loop do
      user_input = prompt_for_search
      break if user_input == "q"
      command = user_input.split(" ")
      result = searcher.public_send("#{command[0]}_match", command[1])
      renderer.render(result)
      save_path = prompt_for_save
      saver.save(save_path, results) unless save_path.empty?
    end
  end

  def welcome(welcome_message = nil)
    default_welcome = "Welcome to Dictionary Searcher"
    welcome_message = welcome_message || default_welcome
    renderer.render(welcome_message)
  end


  def prompt_for_dictionary(prompt = nil)
    default_prompt = "Where's your dictionary?"
    prompt = prompt || default_prompt
    renderer.render(prompt)
    listener.get_stripped_input
  end

  def prompt_for_search
    default_prompt = "Please enter a search type (exact, partial, begins, ends) and term. Example: exact fuzzy"
    prompt = prompt || default_prompt
    renderer.render(prompt)
    listener.get_formatted_input
  end

  def prompt_for_save
    default_prompt = "Where do you want to save your results?  Press enter if you don't want to save."
    prompt = prompt || default_prompt
    renderer.render(prompt)
    listener.get_formatted_input
  end


  private
    attr_reader :renderer, :loader, :saver, :searcher, :listener
end
