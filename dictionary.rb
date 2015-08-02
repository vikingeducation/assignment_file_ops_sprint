class Dictionary
    def interface
        dl = DictionaryLoader.new
        dl.read("5desk.txt")
        model(dl.dict_arr)
    end
     
    def model(array)
       da = DictionaryAnalyzer.new
       da.initial
       puts "Which model do you want to choose"
       puts "1:exact-match 2:partial-match 3:start-match 4:end-match"
       index = gets.chomp
       while !["1","2","3","4","QUIT"].include?(index) do
           puts "no such choice, enter again"
           index = gets.chomp
       end
       abort "you choose to quit" if index == "QUIT"
       puts "now input what part you want to match the dictionary"
       puts "only lowcase except QUIT"
       word = gets.chomp
       abort("you choose to quit") if word == "QUIT"
       case index
       when "1"
       da.exact_match(word, array)
       when "2"
       da.partial_match(word, array)
       when "3"
       da.start_match(word, array)
       when "4"
       da.end_match(word, array)
       end
       da.sort_collect
       brief(da.collect_hash, da.num)
       wrorprt(da.collection)
    end
    
    def brief(hash, num)
       puts "Summary"
       puts "the collection words situation"
       puts "total: #{num} words"
       hash.each do |item|
           print item
           puts""
       end
    end
    
    def wrorprt(array)
        puts "do you want to print[p] out it or write[w] it into a file"
        judge = gets.chomp
        while !["p","w","QUIT"].include?(judge) do
            puts "don't know what you mean, please enter again"
            judge = gets.chomp
        end
        abort("you choose to quit") if judge == "QUIT"
        write(array) if judge == "w"
        if judge == "p"
            array.each do |word|
                puts word
            end
        end
    end
    
    def write(array)
        puts "do you want to overwrite[o] out it or continue write[w] it into the file"
        judge = gets.chomp
        while !["o","w","QUIT"].include?(judge) do
            puts "don't know what you mean, please enter again"
            judge = gets.chomp
        end
        abort("you choose to quit") if judge == "QUIT" 
        if judge == "w"
           File.open("target.txt", "a") do |file|
              array.each do |word|
                  file.write(word + "\n")
              end
           end
        elsif judge == "o"
           File.open("target.txt", "w") do |file|
              array.each do |word|
                  file.write(word + "\n")
              end
           end
        end
    end
end

class DictionaryLoader
    attr_accessor :dict_arr
    
    def read(file)
        @dict_arr = []
        File.readlines(file).each do |line|
            @dict_arr << line.strip
        end
    end
    
end

class DictionaryAnalyzer
    attr_accessor :num, :collection, :collect_hash
    
    def initial
        @num = 0
        @collection = []
        @collect_hash = {}
    end
    
    def exact_match(sample, array)
        array.each do |word|
            if word.downcase == sample
                @num += 1 
                @collection << word
            end
        end
    end
    
    def partial_match(sample, array)
        array.each do |word|
            if /#{sample}/.match(word.downcase)
                @num += 1
                @collection << word
            end
        end
    end
    
    def start_match(sample, array)
        array.each do |word|
            if /\A#{sample}/.match(word.downcase)
                @num += 1
                @collection << word
            end
        end
    end
    
    def end_match(sample, array)
        array.each do |word|
            if /#{sample}\Z/.match(word.downcase)
                @num += 1
                @collection << word
            end
        end
    end
    
    def sort_collect
        @collection.each do |word|
            if @collect_hash[word[0]].to_i > 0
                @collect_hash[word[0]] += 1
            else
                @collect_hash[word[0]] = 1    
            end
        end
        @collect_hash = Hash[@collect_hash.sort]
    end
    
end



=begin
test = ["startpartial","startend","partialend","startpartialend","start"]
a = DictionaryAnalyzer.new
a.initial
#a.exact_match("start", test)
#a.partial_match("partial", test)
a.end_match("end", test)
puts a.num
print a.collection
puts ""
a.sort_collect
a.collect_hash.each do |hash|
    print hash
    puts""
end
=end

d = Dictionary.new
d.interface
