
class DictionarySearcher

  def initialize(dict)
    @dict = dict
  end

  def ask_user_message
    puts "How would you like to search? (exact, partial, begins, ends)"
    input_type = gets.chomp
    puts "what would you like to search?"
    input_str = gets.chomp
    # use input to select search method & desired string
    case input_type
    when "exact"
      exact_matches(input_str)
    when "partial"
      partial_matches(input_str)
    when "begins"
      begins_with_matches(input_str)
    when "ends"
      ends_with_matches(input_str)
    else
      puts "please enter a valid search method!"
      ask_user_message
    end
  end

  def exact_matches(input)
    matches = dict.dict_arr.select do |entry|
      entry === /^#{input}$/
    end
    matches
  end

  def partial_matches(input)

  end

  def begins_with_matches(input)
  end

  def ends_with_matches(input)
  end

  def validate_str?(str)
    raise ArgumentError("Please enter a string") unless str === /[a-zA-Z]/
    true
  end

end
