class Carriage
  include Manufacturer
  include InstanceCounter

  attr_accessor :type
  attr_reader :name

  @@carriage_id = 0

  def initialize(type)
    @name = @@carriage_id
    @@carriage_id += 1
    @type = type
    register_instance
    validate!
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def validate!
    raise 'Enter type' if type.nil?
    true
  end
end
