# saves results to file
class ResultsSaver
  def initialize(searched_for = nil, search_output = nil)
    @seach_term = searched_for
    @search_results = search_output
    @filename = nil
    save_results if prompt_save?
  end

  private

  def prompt_save?
    puts "Do you want to save your results? y/n? 'q' quits."
    command = gets.strip.upcase until ['Y', 'N', 'Q'].include?(command)
    return false if command == 'N'
    exit if command == 'Q'
    true
  end

  def save_results
    get_target_file until check_file_status
    File.open(@filename, 'w') do |file|
      @search_results.each do |word|
        file.write word
        file.write "\n"
      end
    end
  end

  def get_target_file
    puts 'What filepath should we write results to?'
    @filename = gets.strip
  end

  def check_file_status
    return false if @filename.nil?
    return true unless File.exist?(@filename)
    puts "That file exists, overwrite? y/n? 'q' quits."
    command = gets.strip.upcase until ['Y', 'N', 'Q'].include?(command)
    exit if command == 'Q'
    return false if command == 'N'
    true
  end
end
