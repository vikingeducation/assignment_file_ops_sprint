
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
    @saver    = args[:saver]    || ResultsSaver.new
    @searcher = args[:searcher] || DictionarySearcher.new
  end

  def run
    welcome
    searcher.dictionary = get_user_dictionary

    loop do
      user_input = prompt_user("Please enter a search type (exact, partial, begins, ends) and term. Example: exact fuzzy")
      break if user_input == "q"
      result = searcher.search(user_input)

      if result == searcher.unknown_search_type_message
        renderer.render(result)
        next
      end

      result = format_result(result)
      renderer.render(result)

      save_result_file(result) unless result == searcher.unknown_search_type_message
    end
  end

  def welcome(welcome_message = nil)
    default_welcome = "Welcome to Dictionary Searcher"
    welcome_message = welcome_message || default_welcome
    renderer.render(welcome_message)
  end

  def prompt_user(prompt)
    renderer.render(prompt)
    listener.get_stripped_input
  end

  def format_result(result)
    "Found #{result.length}:\n#{result.join("\n")}"
  end

  def get_user_dictionary
    begin
      path = prompt_user("Where's your dictionary?")
    end until dictionary = loader.load(path)
    dictionary
  end

  def save_result_file(result)
    begin
      save_path = prompt_user("Where do you want to save your results?  Press enter if you don't want to save.")
      save_result = saver.save(save_path, result) unless save_path.nil? || save_path.empty?
      renderer.render(save_result)
    end until save_result == "Save successful." || save_path.empty?
  end

  private
    attr_reader :renderer, :loader, :saver, :searcher, :listener
end
