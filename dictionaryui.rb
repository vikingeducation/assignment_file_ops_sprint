require_relative 'dictionary_searcher.rb'
require_relative 'dictionary_loader.rb'

class DictionaryUI
  attr_accessor :letter_count, :word_count, :dict

  def initialize
    @dict = nil
    @letter_count = {}
    @word_count = 0
  end  

  def ask_user_input
    input = ""

    until input.length > 0
      print "Enter the dictionary file name to upload: "
      input = gets.chomp
    end
    file_name = input  
    puts "We will load the dictionary file #{file_name}"

    if @dict = ::DictionaryLoader.load(file_name)
      puts "File #{file_name} loaded successfully!"
      p @dict
      true
    else
      puts "Unable to load your dictionary file #{file_name}!"
      false
    end

  end

  def count_by_letter
    letter_count = {}
    dict = @dict.join("\n")
    
    ("a".."z").to_a.each do |letter|
      count_match = dict.scan(/^#{letter}/i)
      @letter_count[letter] = count_match.length
    end
  
  end

  def print_letter_count
    @letter_count.each do |letter,count|
      puts "#{letter} : #{count}"
    end  
  end  

  def process_dict
    ask_user_input
    count_by_letter
    print_letter_count
    searcher = DictionarySearcher.new(@dict)
    searcher.run
    
  end

end 

dict = DictionaryUI.new
dict.process_dict