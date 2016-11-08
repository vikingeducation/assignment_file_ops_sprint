
require 'forwardable'

class Dictionary
  extend Forwardable
  include Enumerable
  attr_reader :words

  def_delegator :words, :each

  def initialize(args = {})
    @words = args[:words]
  end

end
