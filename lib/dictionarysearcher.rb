module DictionarySearcher

  def search(word)
  	if @dict.dictionary.include?(word)
      puts "Here's your word #{word}"
    else
      puts "Sorry, this word doesn't exist in out DB"
    end
  end

  def stats(path)
  	if path
  	  if @dict.dictionary.count > 1
  	    puts "Your dictionary contains #{@dict.dictionary.count} words."
  	  else
  	  	puts "Your dictionary contains #{@dict.dictionary.count} word."
  	  end
  	else
  	  puts "Invalid Path"
  	end
  end
end
