class DictionaryAnalyzer
  
  def initialize(loader)
    @loader = loader
    @words = @loader.opened_file.readlines.each { |word| word.strip! }
  end
  
  def word_count
    puts ''
    puts "Total words in dictionary: #{@words.size}"
    puts ''
  end
  
  def alphabet_word_count
    alphabet = ('a'..'z').to_a
    
    count = 0
    
    alphabet.each do |letter|
      @words.each do |word|
        if letter == word[0]
          count += 1
        end
      end
      puts "Number of words beginning with #{letter}: #{count}"
      count = 0
    end
  end
  
  def exact_search(term)
    @words.each do |word|
      if term == word
        puts ''
        puts "Found #{term} in the dictionary."
      end
    end
  end
  
  def partial_search(term)
    matches = @words.select { |word| word.include?(term) }
    puts ''
    puts "Found '#{term}' present in the following words:"
    puts ''
    matches.each { |match| puts match }
  end
  
  def begins_with_search(term)
    matches = @words.select { |word| word =~ /^#{term}/ }
    puts ''
    puts "The following words begin with '#{term}':"
    puts ''
    matches.each { |match| puts match }
  end
  
  def ends_with_search(term)
    matches = @words.select { |word| word =~ /#{term}$/ }
    puts ''
    puts "The following words end in '#{term}':"
    puts ''
    matches.each { |match| puts match }
  end
        
  
end