class DictionarySearcher

  def initialize(file)
    @file = file
  end

  def choose_search_and_display(search_type, term)
    case search_type
      when 1
        exact_match(term)
      when 2
        partial_match(term)
      when 3
        begins_with_match(term)
      when 4
        ends_with_match(term)
    end
  end

  private

  def find_and_display(user_input)
    regex = %r[#{user_input}]
    result = @file.join("\n").scan(regex)
    print "Found #{result.size} match"
    print "es" if result.size > 1 || result.size == 0
    print "\n"
    result.each {|word| puts "#{word}"}
  end

  def exact_match(user_input)
    puts "DBG: user_input = #{user_input.inspect}"
    user_input = user_input.capitalize! + "$"
    find_and_display(user_input)
  end

  def partial_match(user_input)
    user_input = "^.*" + user_input + ".*$"
    find_and_display(user_input)
  end

  def begins_with_match(user_input)
    user_input = user_input.capitalize! + ".*$"
    find_and_display(user_input)
  end

  def ends_with_match(user_input)
    user_input = "^.*" + user_input + "$"
    find_and_display(user_input)
  end

end