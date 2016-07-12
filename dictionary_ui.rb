class DictionaryUI
  attr_reader :location

  def run
    puts "Where is your dictionary? ('q' to quit)"
    @location = gets.chomp
    exit if location == "q"
    @location
  end

end