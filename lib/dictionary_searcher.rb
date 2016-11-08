class DictionarySearcher
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def ends_with(str)
    regex = /#{str.strip.downcase}$/
    matches(regex)
  end

  def find(str)
    regex = /#{str.strip.downcase}/
    matches(regex)
  end

  def starts_with(str)
    regex = /^#{str.strip.downcase}/
    matches(regex)
  end

  private
    def matches(regex)
      words.select { |word| word =~ regex }
    end
end