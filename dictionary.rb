# wraps the loaded dictionary
class Dictionary
  attr_accessor :entries

  def initialize(entries)
    @entries = entries
  end

  def stats
    puts '','============= STATS =============='
    render_word_count
    render_letter_frequency
  end

  private

  def render_word_count
    word_count = @entries.length
    puts "Word Count: #{word_count}"
  end

  def render_letter_frequency
    puts "Word Frequency by Starting Letter:"
    sorted = @entries.group_by{|word| word[0].upcase}.sort.to_h
    sorted.each do |letter, entries|
      puts "#{letter}: #{entries.length}"
    end
    puts '==================================='
  end

end
