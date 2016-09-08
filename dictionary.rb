class Dictionary

  def display_stats(location)
    dictionary_length(location)
    dictionary_stats(location)
  end

  def dictionary_length(location)
    length = 0
    File.readlines(location).each do |line|
      length += 1
    end
    puts "# Your dictionary contains #{length} words."
  end

  def dictionary_stats(location)
    frequency = Hash.new
    words = File.readlines(location)
    words.each do |word|
      for i in 'a'..'z'
        if word.start_with?(i)
          frequency[i] = frequency[i].to_i + 1
        end
      end
    end
    puts "# Word frequency by starting letter:"
    frequency.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

end