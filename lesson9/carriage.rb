require_relative 'validation'

class Carriage
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :type
  attr_reader :name

  validate :type, :presence

  @@carriage_id = 0

  def initialize(type)
    @name = @@carriage_id
    @@carriage_id += 1
    @type = type
    register_instance
    validate!
  end
end
