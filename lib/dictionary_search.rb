require_relative './dictionary/dictionary'
require_relative './dictionary/dictionary_ui'
require_relative './dictionary/dictionary_formatter'
require_relative './dictionary/dictionary_loader'
require_relative './dictionary/dictionary_searcher'

d = DictionaryUI.new(loader: DictionaryLoader)
d.run