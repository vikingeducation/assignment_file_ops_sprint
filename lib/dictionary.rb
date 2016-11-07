class Dictionary

  attr_reader :words

  def initialize(args = {})
    @words = args[:words]
  end

end