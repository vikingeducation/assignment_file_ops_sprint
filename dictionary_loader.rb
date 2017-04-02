class DictionaryLoader
  def load(fname)
    @dict = []
    File.readlines(@fname).map { |word| @dict << word.strip }
    Dictionary.new(@dict)
  end
end
