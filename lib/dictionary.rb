class Dictionary
  attr_reader :words
  def initialize(file_data = [])
    @words = file_data
  end
end
