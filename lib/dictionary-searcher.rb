
class DictionarySearcher

  def initialize(dict)
    @dict = dict
  end

  def ask_user_message
    puts "How would you like to search? (exact, partial, begins, ends)"
    input_type = gets.chomp
    puts "what would you like to search?"
    input_str = gets.chomp    

    puts input_type_to_method(input_type, input_str)
 
  end

  def input_type_to_method(input_type, input_str)
    string_to_method = {
      "exact" => method(:exact)
      "partial" => method(:partial)
      "begins" => method(:begins)
      "ends" => method(:ends)
    }
    string_to_method[input_type].call(input_str)
  end

  def exact_matches(input_str)
    matches = dict.dict_arr.select do |entry|
      /^#{input_str}$/ === entry
    end
    matches
  end

  def partial_matches(input_str)
    matches = dict.dict_arr.select do |entry|
      /#{input_str}/ === entry
    end
    matches
  end

  def begins_with_matches(input_str)
    matches = dict.dict_arr.select do |entry|
      /^#{input_str}/ === entry 
    end
    matches
  end

  def ends_with_matches(input_str)
    matches = dict.dict_arr.select do |entry|
      /#{input_str}$/ === entry
    end
    matches
  end


  def validate_str?(str)
    raise ArgumentError("Please enter a string") unless str === /[a-zA-Z]/
    true
  end

end
