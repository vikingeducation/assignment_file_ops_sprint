class DictionaryLoader

#----------

  def load_dictionary

    puts "Where is your dictionary? ('q' to quit)"
    @path = gets.chomp

    exit if @path == 'q'

    if File.exist?(@path) 
      dictionary_length(@path)
      dictionary_stats(@path)
    else
      puts "File not found."
    end

  end

#----------

  def dictionary_length(path)

    length = 0

    File.readlines(path).each do |e|
      length += 1
    end

    puts "Your dictionary contains #{length} words."

  end

#----------

  def dictionary_stats(path)

    frequency = Hash.new

    words = File.readlines(path)

    words.each do |e|
      for x in 'a'..'z'
        if e.start_with?(x)
          frequency[x] = frequency[x].to_i + 1
        end
      end
    end

    puts "Word frequency by starting letter."

    frequency.each do |key, value|
      puts "#{key}: #{value}"
    end

  end

#----------

end