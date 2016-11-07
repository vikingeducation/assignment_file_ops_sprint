
class DictionaryUI

  def initialize(args={})
    @listener = args.fetch(:listener)
    @renderer = args.fetch(:renderer)
    @searcher = args.fetch(:searcher)
    @saver = args.fetch(:saver)
  end

end
