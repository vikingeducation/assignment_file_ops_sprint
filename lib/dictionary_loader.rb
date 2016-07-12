#dictionary_loader.rb
class DictionaryLoader

  def load(dict)
    File.readlines(dict).map!{|word| word.chomp}    
  end  
end