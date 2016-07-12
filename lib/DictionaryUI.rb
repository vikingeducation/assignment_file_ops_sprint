class DictionaryUI

  def display
    puts "What word to you want to lookup?"
    word_to_lookup = gets.strip
    ResultsSaver.new.save_to()
  end

end
