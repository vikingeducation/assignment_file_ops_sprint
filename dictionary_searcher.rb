require_relative 'results_saver.rb'
class DictionarySearcher

  def search(search_type, search_term, location)

    @dict_array = []
    File.readlines(location).each do |line|
      @dict_array << line.strip
    end

    case search_type
    when 1
      results = @dict_array.select{|word| /^#{search_term.downcase}$/.match(word.downcase)}
    when 2
      results = @dict_array.select{|word| /#{search_term.downcase}/.match(word.downcase)}
    when 3
      results = @dict_array.select{ |word| /\A#{search_term.downcase}/.match(word.downcase)}
    when 4
      results = @dict_array.select{ |word| /#{search_term.downcase}\z/.match(word.downcase)}
    end
    return display_matches(results)
  end

  def display_matches(results)
    puts "# Found #{results.length} matches:"
    results.each do |match|
      puts match
    end
  end
end