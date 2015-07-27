class DictionaryLoader
 
  def self.open(filename)
    output = []
    
    File.readlines(filename).each do |line|
      output << line.strip.downcase
    end
    
    output
  end
  
end