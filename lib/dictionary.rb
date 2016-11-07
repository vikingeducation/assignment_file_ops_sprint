class Dictionary
  attr_reader :entries, :entry_count, :words_by_letter

  include Enumerable

  def initialize(entries)
    @entries = upcase_entries(entries)
    @entry_count = entries.length
    @words_by_letter = words_by_letter
  end

  def each
    entries.each do |entry|
      yield(entry)
    end
  end

  def upcase_entries(entries)
    entries.map { |entry| entry.upcase }
  end

  def words_by_letter
    # TODO @words_by_letter ||= 
    words_by_letter = Hash.new(0)
    ("A".."Z").each do |char|
      words_by_letter[char] = 0
    end
    @entries.each do |entry|
      starting_letter = entry[0].upcase
      words_by_letter[starting_letter] += 1
    end
    @words_by_letter = words_by_letter
  end
end
