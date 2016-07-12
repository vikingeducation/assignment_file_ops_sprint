class DictionaryLoader

  def load(dict)
    mode = "r+"
    file = File.open(dict, mode)
    puts "..."
    return Dictionary.new(file)
  end

  def print_stats(dict)
    puts "There are #{dict.readlines.length} words in this dictionary."
    puts "Word frequency by starting letter:"

    words_arr = dict.readlines.map!{|word| word.chomp}

    # Array('A'..'Z').each 
    # capital of each letter will be break point, that index -1 is previous letter's word count
    # subtract word count of each previous letter off of it too

    Array('A'..'Z').each do |letter|

      puts "#{letter}: #{letter_count}"
    end
  end   

end