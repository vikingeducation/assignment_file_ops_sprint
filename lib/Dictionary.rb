# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def frequency

    frequency_hash = { }

    file.each do |e|
      e = e.downcase
      for x in 'a'..'z'
        if e.start_with?(x)
          frequency_hash[x] = frequency_hash[x].to_i + 1
        end
      end
    end

    puts "Word frequency by starting letter."

    frequency_hash.each do |key, value|
      puts "#{key}: #{value}"
    end

  end

end