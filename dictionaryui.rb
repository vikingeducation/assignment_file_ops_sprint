
class DictionaryUI
  attr_accessor :letter_count, :word_count, :dict

  def initialize
    @dict = nil
    @letter_count = {}
    @word_count = 0
  end  

  def ask_user_input

    dict_file = ""

    until dict_file != ""
      print "Where is your dictionary? ('q' to quit) "
      dict_file = gets.chomp
      puts dict_file

      if File.file?(dict_file)
         @dict = File.readlines(dict_file)
        
         @word_count = @dict.size

         puts "No of words is : #{@word_count}"

      end

    end

  end

  def count_by_letter
    letter_count = {}
    dict = @dict.join("\n")
    
    ("a".."z").to_a.each do |letter|
      count_match = dict.scan(/^#{letter}/i)
      @letter_count[letter] = count_match.length
    end
  
    print_letter_count
  
  end

  def print_letter_count
    @letter_count.each do |letter,count|
      puts "#{letter} : #{count}"
    end  
  end  

  def process_dict
    ask_user_input
    count_by_letter
  end

end 

dict = DictionaryUI.new
dict.process_dict