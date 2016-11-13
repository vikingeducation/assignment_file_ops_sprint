class Dictionary

  attr_reader :words

  def initialize(words)
    @words = words
    show_status
  end

  def word_count
    @words.length
  end
  
  def words_by_letter
    @words.each_with_object({}) do |word, letters_key|
      first_letter = word[0].upcase
      letters_key[first_letter] ||= []
      letters_key[first_letter] << word
      # p letters_key[first_letter]
    end
  end

  def show_status
    puts "Dictionary successfully loaded!"
    puts "Your dictionary contains #{words.length} words"
    puts "Word frequency by starting letter:"    
    words_by_letter.each do |letter, words|
      puts "#{letter}: #{words.length}"
    end
  end

  


end
