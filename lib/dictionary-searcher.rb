
class DictionarySearcher

  def initialize(dict_arr)
    @dict_arr = dict_arr
  end

  def ask_user
    input_type = ask_for_search_type 
    input_str = ask_for_query
    matches = input_type_to_method(input_type, input_str)
    display_matches(matches)
  end

  def ask_for_search_type
    puts "How would you like to search? (exact, partial, begins, ends)"
    input_type = gets.chomp 

    unless valid_search_type?(input_type)
      puts "That was not a valid choice. Choose again."
      ask_for_search_type
    end
    input_type
  end
    
  def ask_for_query
    puts "what would you like to search?"
    input_str = gets.chomp

    unless valid_query?(input_str)
      puts "That was not a valid choice. Choose again."
      ask_for_query
    end
    input_str
  end

  def valid_search_type?(entry)
    %w(exact partial begins ends).include?(entry)
  end

  def valid_query?(input_str)
    /[a-zA-Z]/ === input_str
  end

  def input_type_to_method(input_type, input_str)
    string_to_method = {
      "exact" => method(:exact_matches),
      "partial" => method(:partial_matches),
      "begins" => method(:begins_with_matches),
      "ends" => method(:ends_with_matches)
    }
    string_to_method[input_type].call(input_str)
  end

  def exact_matches(input_str)
    matches = @dict_arr.select do |entry|
      /^#{input_str}$/ === entry
    end
    matches
  end

  def partial_matches(input_str)
    matches = @dict_arr.select do |entry|
      /#{input_str}/ === entry
    end
    matches
  end

  def begins_with_matches(input_str)
    matches = @dict_arr.select do |entry|
      /^#{input_str}/ === entry
    end
    matches
  end

  def ends_with_matches(input_str)
    matches = @dict_arr.select do |entry|
      /#{input_str}$/ === entry
    end
    matches
  end

  def display_matches(matches)
    puts "Here are your matches:"
    matches.each do |match|
      puts match
    end
  end


end
