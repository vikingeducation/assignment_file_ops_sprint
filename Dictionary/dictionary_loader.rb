class DictionaryLoader
  def compute_dictionary_stats(location)
    @first_letter = Hash.new(0)
    @dictionary_lines = File.readlines(location)
    ('a'..'z').each do |letter|
      @dictionary_lines.each do |word|
        @first_letter[letter] += 1 if word[0] == letter 
      end
    end
  end

  def display_dictionary_stats
    @first_letter.each do |first_letter, count|
      puts "#{first_letter}: #{count}"
    end
  end
end

