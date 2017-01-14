# the class which wraps the loaded dictionary.
class Dictionary
  attr_reader :entries, :words

  def initialize(entries)
    @entries = entries
    @words = {}
    calculate_word_frequency
  end

  def calculate_word_frequency
    @entries.each do |word|
      l = word[0].downcase.to_sym
      if @words[l]
        @words[l] += 1
      else
        @words[l] = 1
      end
    end
  end

end
