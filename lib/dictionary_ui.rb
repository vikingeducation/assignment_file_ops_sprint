class DictionaryUI
  def run
    load_and_display_dictionary
    search_dictionary_and_display_results
    save_to_file
  end

  private

  def load_and_display_dictionary
    answer = ask("Where is your dictionary? ('q' to quit)")
    return if answer.empty?

    @dictionary = DictionaryLoader.new(answer).load

    say "Dictionary successfully loaded"
    say "Your dictionary contains #{@dictionary.size} words."

    say "Word frequency by starting letter:"
    @dictionary.word_frequency.each { |char, count| say "#{char}: #{count}" }
  end

  def search_dictionary_and_display_results
    type_of_search = ask <<~MSG
                  What kind of search? ('q' to quit)
                  1: Exact
                  2: Partial
                  3: Begins With
                  4: Ends With
                 MSG
    term = ask("Enter the search term")
    searcher = DictionarySearcher.new(@dictionary)
    @results = searcher.search(term, type_of_search.to_i)

    say "Found #{@results.size} matches:"
    @results.each { |word| say "# #{word}" }
  end

  def save_to_file
    return unless yes?("Do you want to save results? y/n? 'q' quits.")
    path = ask("What filepath should we write results to?")

    if File.exists?(path)
      return unless yes? "That file exists, overwrite? y/n? 'q' quits."
      ResultsSaver.save(@results, path)
      say("# File successfully overwritten!")
    end

    ResultsSaver.save(@results, path)
    say "Search results where saved."
  end

  def ask(prompt, quit_word = 'q')
    loop do
      $stdout.puts prompt
      print '> '
      answer = $stdin.gets.chomp
      return answer if !answer.empty? || answer == quit_word
    end
  end

  def say(message)
    $stdout.puts message
  end

  def yes?(question)
    answer = loop do
      $stdout.puts question
      print '> '
      answer = $stdin.gets.chomp
      break answer if %w(q y n).include? answer
    end

    answer.downcase == 'y'
  end
end
