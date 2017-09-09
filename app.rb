

#require_relative "dictionary_loader.rb"

require_relative "dictionary_ui.rb"

#for the main page
d = DictionaryUI.new
d.run

class Dictionary
  #is the class which wraps the loaded dictionary.
end

class DictionarySearcher
  #is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.
  def initialize()
    p "What kind of search?"
    p "1: Exact"
    p "2: Partial"
    p "3: Begins With"
    p "4: Ends With"
    @search = gets.chomp
    p "Enter the search term"
    @term = gets.chomp
  end

  def searcher()
    if @search == "1"
      p "Found #{$arr.select{|str| str =~ /\b#{@term}\b/}.count} matches"
      $arr.select{|str| str =~ /\b#{@term}\b/}.each do |match|
        p match
      end
      $results = $arr.select{|str| str =~ /\b#{@term}\b/}
    elsif @search == "2"
      p "Found #{$arr.select{|str| str =~ /#{@term}/}.count} matches"
      $arr.select{|str| str =~ /#{@term}/}.each do |match|
        p match
      end
      $results = $arr.select{|str| str =~ /#{@term}/}
    elsif @search == "3"
      p "Found #{$arr.select{|str| str =~ /^#{@term}.*$/}.count} matches"
      $arr.select{|str| str =~ /^#{@term}.*$/}.each do |match|
        p match
      end
      #p $arr.select{|str| str =~ /^#{@term}.*$/}
    elsif @search == "4"
      p "Found #{$arr.select{|str| str =~ /^.*#{@term}$/}.count} matches"
      $arr.select{|str| str =~ /^.*#{@term}$/}.each do |match|
        p match
      end
      $results = $arr.select{|str| str =~ /^.*#{@term}$/}
    else
      p "search term error"
    end
  end

end

#for the main page
start = DictionarySearcher.new
start.searcher

class ResultsSaver
  # takes a batch of results and writes them to a file.
  def initialize()
    p "Do you want to save results? y/n? 'q' quits."
  end

  def getresponse()
    @response = gets.chomp
  end

  def savefile()
    p "What filepath should we write results to?"
    @path = gets.chomp
    out_file = File.new("#{@path}", "w+")
    $results.each do |str|
      out_file.puts("#{str}")
    end
    out_file.close
    p "File saved. Congrats!"
  end

  def conditional()
    if @response == 'y'
      savefile()
    elsif @response == 'n'
    else
      p "Your response was invalid"
      p "Do you want to save results? y/n? 'q' quits."
      getresponse()
    end
  end

end

startsaving = ResultsSaver.new
startsaving.getresponse
startsaving.conditional
