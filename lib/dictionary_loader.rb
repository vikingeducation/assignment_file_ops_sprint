class DictionaryLoader

  def self.load(file_path)
    raise ArgumentError unless file_path.is_a? String
    raise ArgumentError unless File.exist?(file_path)
    data =  File.readlines(file_path).each do |line|
              line.chomp
            end
    Dictionary.new(data)
  end
end
