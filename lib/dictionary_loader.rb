require_relative 'dictionary'

class DictionaryLoader

  def load(file_path)
    if File.exist?(file_path)
      File.open(file_path, 'r') do |file|
        words = file.read.split("\r\n")
        words.each { |word| word.downcase! }
        Dictionary.new(words: words)
      end
    else
      nil
    end
  end
end
