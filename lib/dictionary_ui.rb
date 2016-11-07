class DictionaryUI

  def gets_dictionary_filepath
    puts "Enter dictionary filepath please"
    gets.chomp
  end

  def run
    filepath = gets_dictionary_filepath
  end

end