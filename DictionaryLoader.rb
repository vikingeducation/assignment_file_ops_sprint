
class DictionaryLoader
    attr_accessor  :dictionary, :beginning_letter_hash
    def initialize (path = nil)
        @path = path || "./5desk.txt"
    end

    def load_dictionary
        file = File.open(@path, "r")
        @dictionary = file.readlines

        @beginning_letter_hash = Hash.new( 0 )
        @dictionary.each do | word |
            @beginning_letter_hash[word[0].upcase] += 1
        end

    end


end


# d = DictionaryLoader.new
# d.load_dictionary
# puts d.dictionary[333]
# puts d.dictionary.length
# puts d.beginning_letter_hash





