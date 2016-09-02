class DictionaryLoader

#----------

  def load_dictionary

    puts "Where is your dictionary? ('q' to quit)"
    path = gets.chomp

    exit if path == 'q'

    if File.exist?(path)
      return File.open(path, 'r')
      #dictionary_length(@path)
      #dictionary_stats(@path)
    else
      puts "File not found."
      exit
    end

  end

#----------

  def close_dictionary(dictionary)

    dictionary.close

  end

#----------

end