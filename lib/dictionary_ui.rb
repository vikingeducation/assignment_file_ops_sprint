class DictionaryUI
  def prompt
    puts "Where is your dictionary? ('q' to quit)"

    dictionary_path = gets.chomp.downcase

    dictionary_path == 'q' ? exit : dictionary_path
  end
end