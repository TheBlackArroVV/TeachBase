class Carriage
  include Manufacturer
  include InstanceCounter

  attr_accessor :type

  def initialize(type)
    @type = type
    self.register_instance
  end
end
