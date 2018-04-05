class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :number
  attr_reader :type
  attr_accessor :speed
  attr_accessor :carriages

  @@trains = {}

  def self.find(number)
    puts @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    @@trains[number] = self
    self.register_instance
  end

  def raise_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    if carriage.type == self.type && self.speed.zero?
      self.carriages << carriage
    else
      puts "Try again later"
    end
  end

  def delete_carriage(carriage)
    if self.speed == 0
      carriages.delete(carriage)
    else
      puts "Stop before"
    end
  end
end
