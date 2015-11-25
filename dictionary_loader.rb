class DictionaryLoader
  # Reads in the specified dictionary file.

  def initialize
    @dictionary = load_5desk
  end

  private

  def load_5desk
    words = []
    File.readlines('5desk.txt').each do |line|
      words << line.strip
    end
    words
  end

end