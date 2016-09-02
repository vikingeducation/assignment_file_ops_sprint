require "./dictionary_searcher"
require "./results_saver"

class Dictionary

  def initialize(dictionary)
    @dictionary = dictionary
  end

#----------

  def dictionary_length

    length = 0

    File.readlines(@dictionary).each do |e|
      length += 1
    end

    puts "Your dictionary contains #{length} words."

  end

#----------

  def dictionary_stats

    frequency = Hash.new

    words = File.readlines(@dictionary)

    words.each do |e|
      for x in 'a'..'z'
        if e.start_with?(x)
          frequency[x] = frequency[x].to_i + 1
        end
      end
    end

    puts "Word frequency by starting letter."

    frequency.each do |key, value|
      puts "#{key}: #{value}"
    end

  end

#----------

  def search_dictionary

    searcher = DictionarySearcher.new

    @results = searcher.perform_search(@dictionary)

  end

#----------

  def save

    saver = ResultsSaver.new

    saver.save(@results)

  end










end