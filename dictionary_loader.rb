class DictionaryLoader
  def self.load(dictionary_file)
    return false unless File.exists?(dictionary_file)
    # check if dictionary_file is a valid path
    dictionary = Dictionary.new
    File.open(dictionary_file).each do |line|
      word = line.strip
      dictionary.add_word(word)
    end
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{dictionary.size} words."
    puts "Word frequency starting by letter:"
    dictionary.display_letter_frequencies
    dictionary
  end
end
