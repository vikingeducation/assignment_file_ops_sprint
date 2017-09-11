require_relative 'dictionary_loader.rb'

class Dictionary 
  def compute_dictionary_stats(dictionary_lines)
    @dictionary_lines = dictionary_lines
    @first_letter_count = Hash.new(0)
    ('a'..'z').each do |letter|
      @dictionary_lines.each do |word|
        @first_letter_count[letter] += 1 if word[0] == letter 
      end
    end
  end

  def display_dictionary_stats
    puts "Your dictionary contains #{@dictionary_lines.size} words."
    puts "Word frequency by starting letter:"
    @first_letter_count.each do |first_letter, count|
      puts "#{first_letter}: #{count}"
    end
  end
end