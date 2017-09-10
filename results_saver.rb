require 'pathname'

class ResultsSaver
  # takes a batch of results and writes them to a file.
  def initialize()
    p "Do you want to save results? y/n? 'q' quits."
  end

  def getresponse()
    @response = gets.chomp
  end

  def checkpath()
    pn = Pathname.new(@path)
    while pn.exist?
      p "File already exists. Enter another path"
      @path = gets.chomp
      pn = Pathname.new(@path)
      break if pn.exist? != true
    end
  end

  def savefile()
    p "What filepath should we write results to?"
    @path = gets.chomp
    checkpath()
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
