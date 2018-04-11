require_relative 'accessors'
require_relative 'validation'

class Test
  extend Accessors
  include Validation

  attr_accessor :field

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :z, String

  # validate :a, :presence

  def initialize(value = 0)
    @field = value
  end

end
