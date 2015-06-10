require './dictionary_loader'
require './dictionary_analyzer'


class Dictionary

  def initialize(filename = "")
    if filename.empty?
      puts "Enter the name & extension of your dictionary file:"
      print " > "
      filename = gets.chomp
    end

    load(filename)
  end


  def load(filename)
    @loader = DictionaryLoader.new(filename)
    @dictionary = @loader.dictionary
  end


  def analyze
    @analyzer = DictionaryAnalyzer.new(@dictionary)
    puts "Total word count: #{@analyzer.stats[:word_count]}"
    @analyzer.stats[:word_count_by_letter].each do |key, value|
      print "#{key.to_s.upcase}: #{value}\t"
    end
  end


  def search
    parameters = get_search_parameters
    #puts "How would you like to search?\n\t1) Exact match\n\t2) Partial match\n\t3) Beginning with\n\t4) Ending with"
    #print " > "
    #option = gets.chomp.to_i

    #puts "What would you like to search for?"
    #print " > "
    #term = gets.chomp
    regex = define_search_regex(parameters)
    #case option
    #  when 1
    #    regex = /^#{term}$/i
    #  when 2
    #    regex = /^.*#{term}.*$/i
    #  when 3
    #    regex = /^#{term}.*$/i
    #  when 4
    #    regex = /^.*#{term}$/i
    #end

    results = run_search(regex)


    process_search_results(results)
    #puts "Number of matches: #{output.count}"
    #puts "Would you like to:\n\t1) Display the results, or\n\t2) Save the results?"
    #print " > "

  end


  private


  def get_search_parameters
    puts "How would you like to search?\n\t1) Exact match\n\t2) Partial match\n\t3) Beginning with\n\t4) Ending with"
    print " > "
    option = gets.chomp.to_i

    puts "What would you like to search for?"
    print " > "
    term = gets.chomp

    [option, term]
  end


  def define_search_regex(parameters)
    option = parameters[0]
    term = parameters[1]

    case option
      when 1
        regex = /^#{term}$/i
      when 2
        regex = /^.*#{term}.*$/i
      when 3
        regex = /^#{term}.*$/i
      when 4
        regex = /^.*#{term}$/i
    end

    regex
  end


  def run_search(regex)
    output = []

    @dictionary.each do |entry|
      output << entry if entry.match(regex)
    end

    output
  end


  def process_search_results(results)
    puts "Number of matches: #{results.count}"
    puts "Would you like to:\n\t1) Display the results, or\n\t2) Save the results?"
    print " > "
    destination = gets.chomp.to_i

    puts results if destination == 1
    save_search_results(results) if destination == 2
  end


  def save_search_results(results)
    puts "Enter filename:"
    print " > "
    save_file = gets.chomp

    if File.exist?(save_file)
      puts "Warning: #{save_file} already exists.  Overwrite (y/n)?"
      print " > "
      permission = gets.chomp
    else
      permission = "y"
    end

    if permission.downcase[0] == "y"

      File.open(save_file, "w") do |file|
        results.each { |result| file.write(result + "\n") }
      end
      puts "Save completed."

    else
      puts "Save cancelled."
    end

  end


end