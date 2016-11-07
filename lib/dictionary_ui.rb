
require_relative 'dictionary_searcher'
require_relative 'dictionary_loader'
require_relative 'ui_listener'
require_relative 'ui_renderer'
require_relative 'results_saver'

class DictionaryUI

  def initialize(args = {})
    @listener = args[:listener] || UIListener
    @loader   = args[:loader]   || DictionaryLoader
    @renderer = args[:renderer] || UIRenderer
    @saver    = args[:saver]    || ResultsSaver
    @searcher = args[:searcher] || DictionarySearcher.new
  end

  def run
    welcome
    prompt_user_for_dictionary
  end

  def welcome(welcome_message = nil)
    default_welcome = "Welcome to Dictionary Searcher"
    welcome_message = welcome_message || default_welcome
    renderer.render(welcome_message)
  end

  def prompt_user_for_dictionary
    path_prompt = "Where's your dictionary"
    #renderer.render(path_prompt)
  end

  private
    attr_reader :renderer
end
