
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
    end

    def match_partial( fragment )
        @dict.each do | entry |
            @results << entry if entry.include? fragment
        end
    end

    def begins_with( fragment )
        @dict.each do | entry |
            @results << entry if entry[0...fragment.length] == fragment
        end
    end

    def ends_with( fragment )
        @dict.each do | entry |
            entry_l = entry.length
            fragment_l = fragment.length
            @results << entry if entry[ (entry_l-fragment_l...entry_l) ] == fragment
        end
    end


end

# wl = 4
# length = 9
# puts "koziscool"[(length - wl)...length]

# d = DictionarySearcher.new( ["consent", "absent", "tetris", "racecar", "sentfor"] )
# puts d.results
# d.match_partial("sent")
# puts d.results

