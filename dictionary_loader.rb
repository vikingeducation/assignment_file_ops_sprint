class DictionaryLoader
  #is a helper class whose single responsibility is to load in the dictionary.
  #perform the loading and processing of the specified dictionary file
  #before returning it as an instance of a Dictionary
  def initialize(location)
    @location = location
    $arr = File.readlines(@location)
    $arr = $arr.map do |str| str.strip end
  end


end
