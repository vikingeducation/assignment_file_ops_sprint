class Dictionary
  
  attr_reader :dic

  def initialize
    @dic=DictionaryLoader.new.dic
    @dic_analyzer = DictionaryAnalyzer.new(@dic)
    puts @dic_analyzer.word_count
    puts @dic_analyzer.count_words_beg_with("a")
    puts @dic_analyzer.exact_match("apple")

  end

  def search
    puts "What you would like me to look for? (method , word)"

    ans_arr=gets.chomp
    ans_arr = ans_arr.split(",")

    case ans_arr[0]
      
      when "partial_match"
        matches = @dic_analyzer.partial_match(ans_arr[1])
        puts matches.length
        ask(matches)

      when "exact_match"
        matches = @dic_analyzer.exact_match(ans_arr[1])
        puts 1
        ask(matches)

      when "begins_with"
        matches = @dic_analyzer.begins_with(ans_arr[1])
        puts matches.length
        ask(matches) 

      when "ends_with" 
        matches = @dic_analyzer.ends_with(ans_arr[1])
        puts matches.length
        ask(matches) 
    end
        
      


  end

  def ask(array)
    puts "What you would like me to do?"
      act=gets.chomp
      case act
        when "S"
          puts "What would you like to name this file?"
          file_name = gets.chomp
          if File.exist?("#{file_name}.txt") 
            puts "Would you like to overwrite the file? (y/n)"
            if gets.chomp == "n"
              exit
            end
          end
          File.open("#{file_name}.txt","w") do |file|
          file.write array
        end

        when "P"
          puts array

        when "Q"
          exit

        else
          search
      end    
  end

end


class DictionaryLoader
  attr_reader :dic
  def initialize(filename="5desk.txt")
    @dic=File.readlines(filename)
    @dic.map! {|word| word.chomp}

  end


end

class DictionaryAnalyzer
  attr_reader :dictionary
  def initialize(dictionary)
    @dictionary=dictionary
  end


  def word_count
    
    @dictionary.length
  end

  def count_words_beg_with(letter)
    @dictionary.select {|word| word[0].downcase == letter.downcase}.length
  end

  def exact_match(word)
    @dictionary.include?(word.downcase) ? word.downcase : false

   
  end

  def partial_match(word)
    #sunshine for Sun
    @dictionary.select {|el| el.downcase.include?(word.downcase)} 
  end

  def begin_with(word)
    @dictionary.select {|el| el.downcase.start_with?(word.downcase)} 
  end

  def end_with(word)
    @dictionary.select {|el| el.downcase.end_with?(word.downcase)} 
  end

end
d = Dictionary.new

d.search

dic_arr = DictionaryAnalyzer.new(d.dic)
#puts dic_arr.partial_match("sun")
#puts dic_arr.begin_with("sun")
#puts dic_arr.end_with("ment")

# puts dic_arr.count_words_beg_with("a")
