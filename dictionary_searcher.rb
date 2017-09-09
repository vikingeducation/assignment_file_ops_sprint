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
