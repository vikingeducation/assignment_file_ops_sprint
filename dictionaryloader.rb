class DictionaryLoader
  
  attr_accessor :opened_file
  
  def initialize(dict_file)
    @opened_file = File.open(dict_file, 'r+')
  end

end