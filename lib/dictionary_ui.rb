class DictionaryUI
  include Questionable

  def run
    load_and_display_dictionary
    search_dictionary_and_display_results
    save_to_file
  end

  private

  def load_and_display_dictionary
    answer = ask("Where is your dictionary? ('q' to quit)")
    abort "We can't find the dictionary." unless File.exist?(answer)

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

    @results = case type_of_search.to_i
               when 1 then searcher.search_exact(term)
               when 2 then searcher.search_partial(term)
               when 3 then searcher.search_start_with(term)
               when 4 then searcher.search_end_with(term)
               end

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
end
