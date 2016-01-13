
class DictionarySearcher

    attr_accessor :results

    def initialize( dict )
        @dict = dict
        @results = []
    end

    def match_exact ( word )
        @dict.each do | entry |
            results << entry if entry == word
        end
        display_results
    end

    def match_partial( fragment )
        @dict.each do | entry |
            @results << entry if entry.include? fragment
        end
        display_results
    end

    def begins_with( fragment )
        @dict.each do | entry |
            @results << entry if entry[0...fragment.length] == fragment
        end
        display_results
    end

    def ends_with( fragment )
        @dict.each do | entry |
            entry_l = entry.length
            fragment_l = fragment.length
            @results << entry if entry[ (entry_l-fragment_l...entry_l) ] == fragment
        end
        display_results
    end

    def display_results 
        puts "Found #{results.length} matches:"
        results.each { |result| puts result }
    end

end

# wl = 4
# length = 9
# puts "koziscool"[(length - wl)...length]

# # d = DictionarySearcher.new( ["consent", "absent", "tetris", "racecar", "sentfor"] )
# d.display_results
# d.match_partial("sent")

