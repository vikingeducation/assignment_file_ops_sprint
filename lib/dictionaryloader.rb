class DictionaryLoader
  attr_accessor :dictionary_array
  def initialize(filename)
    File.open(filename, "r+") do |file|
      @dictionary_array = file.readlines.map{|line| line.strip}
    end
  end
end