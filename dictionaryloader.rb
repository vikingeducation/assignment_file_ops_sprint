require_relative 'dictionary'

# Loads dictionary file and returns Dictionary instance
class DictionaryLoader
  def initialize(source)
    @file = source
    @contents = []
  end

  def load
    return puts 'No such file' unless File.exist?(@file)
    @contents = File.readlines(@file)
    clean_contents
    Dictionary.new(@contents)
  end

  private

  def clean_contents
    @contents.each_with_index do |line, index|
      @contents[index] = line.strip
    end
  end
end
