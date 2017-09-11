class DictionaryLoader
  def load_dictionary(dictionary_location)
    @dictionary_lines = File.readlines(dictionary_location)
    puts "Dictionary successfully loaded." unless @dictionary_lines.empty?
    @dictionary_lines
  end
end

