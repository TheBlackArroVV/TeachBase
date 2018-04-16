require_relative 'accessors'
require_relative 'validation'

class Test
  extend Accessors
  include Validation

  attr_accessor :field

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :z, String
  strong_attr_accessor :x, String

  # validate :a, :presence
  # validate :a, :format, /^[a-z]{3}$/
  validate :a, :type, String

  def initialize(value = '')
    @a = value
  end
end
