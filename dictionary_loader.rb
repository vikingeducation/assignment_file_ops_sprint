class DictionaryLoader

  def load_file file_path
    dictionary = File.readlines(file_path)
    puts "Dictionary successfully loaded"
    dictionary_analyse dictionary
    refine_dictionary dictionary
  end

  def dictionary_analyse dictionary
    puts "Your dictionary conatains #{dictionary.length} words"
    puts "Word frequency by starting letter:"
    ('A'..'Z').each do |letter|
      frequency = count_num(letter, dictionary)
      puts "#{letter.upcase}: #{frequency}"
    end
  end

  def count_num letter, dictionary
    filtered_result = dictionary.select do |word|
      /^#{letter}|^#{letter.downcase}(.*)/ =~ word
    end
    filtered_result.length
  end

  def refine_dictionary dictionary
    arr = []
    dictionary.each do |line|
      arr << line.strip
    end
    arr
  end

end
