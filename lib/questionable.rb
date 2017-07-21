module Questionable
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
