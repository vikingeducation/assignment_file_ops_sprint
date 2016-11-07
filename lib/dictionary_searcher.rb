# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

# class DictionarySearcher

#   attr_accessor :word_count

#   def initialize(dictionary)
#     word_count = count_the_words(dictionary)
#   end

#   def count_the_words(dictionary)
#     count = 0
#     @word_count = File.readlines(dictionary).each do |line|
#       count += 1
#     end
#     count
#   end

# end