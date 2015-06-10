class DictionaryLoader
  attr_reader :dictionary

  def initialize(dictionary_file)

    @dictionary = File.readlines(dictionary_file)

    strip_lines

    puts "File #{dictionary_file} successfully loaded!"

  end


  private


  def strip_lines

    @dictionary.each do |line|
      line.strip!
    end

  end

end