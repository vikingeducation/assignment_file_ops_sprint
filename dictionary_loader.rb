class DictionaryLoader
  def initialize
    @dict = {}
  end

  def load(path)
    begin
      File.readlines(path).each do |line|
        @dict[line.strip.upcase] ? @dict[line.strip.upcase] += 1 : @dict[line.strip.upcase] = 1
      end
      puts "Dictionary was successfully loaded from #{path}"
      puts "Your dictionary contains #{@dict.values.reduce(:+)} words"
    rescue
      puts "Wrong filename #{path}, please try again with a valid file"
    end
    @dict
  end
end
