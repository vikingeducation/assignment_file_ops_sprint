class DictionaryLoader


  def self.load(file_name)

    @dict = File.readlines(file_name)
    @dict.map! {|item| item.strip}
    if @dict.length > 0
       @dict
    else
       false
    end     
  end
  
end  
