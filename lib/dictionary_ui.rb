class DictionaryUI

  def run
    loop do
      get_dictionary
      get_search
      ask_save
    end
  end

  def get_dictionary
    puts "What is the path to your dictionary?"
    path = gets.chomp
    @dictionary = DictionaryLoader.load(path)
  end

  def get_search
    puts "What kind of search?"
    puts "1: Exact", "2: Partial", "3: Begins with", "4: Ends with"
    # get contents
    # check fo rq
  end

  def ask_save
    #
  end
end