
class DictionaryLoader

  attr_reader :arr

  def initialize(file_path)
    @arr = []
    create_array(file_path)
  end

  def create_array(file_path)
    count = 0
    dict = File.open(file_path, "r")
    dict.readlines.each do |line|
     @arr << line.chomp.upcase
      count += 1
    end
    count
  end

  # def arr
  #   @arr
  # end

end