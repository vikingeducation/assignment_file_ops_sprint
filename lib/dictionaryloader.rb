class DictionaryLoader
  attr_reader :file, :dictionary

  def initialize
  	@file = File.readlines("../5desk.txt")
  	@dictionary = []
  	strip_new_lines(@file)
  	puts "Dictionary successfully loaded..."
    puts "################################"
  end

  private

  def strip_new_lines(path)
  	path.each { |i| @dictionary << i.strip }
  end

end
