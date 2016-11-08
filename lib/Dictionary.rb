# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :file, :frequency_hash

  def initialize(file)
    @file = file
    @frequency_hash = {}
  end

  def frequency
    file.each do |e|
      e = e.downcase
      for x in 'a'..'z'
        if e.start_with?(x)
          @frequency_hash[x] = @frequency_hash[x].to_i + 1
        end
      end
    end   
  end

end