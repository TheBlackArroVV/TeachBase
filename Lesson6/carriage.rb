class Carriage
  include Manufacturer
  include InstanceCounter

  attr_accessor :type

  def initialize(type)
    @type = type
    self.register_instance
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Enter type" if type.nil?
    true
  end
end
