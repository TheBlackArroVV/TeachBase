require_relative 'manufacturer.rb'
require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number
  attr_reader :type
  attr_accessor :speed
  attr_accessor :carriages

  REG_EXP = /^[a-z0-9]{3}[-]*[a-z0-9]{2}$/

  validate :number, :presence
  validate :type, :presence
  validate :number, :format, REG_EXP

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
    register_instance
    validate!
  end

  def raise_speed(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    if carriage.type == type && self.speed.zero?
      carriages << carriage
    else
      puts 'Try again later'
    end
  end

  def delete_carriage(carriage)
    if self.speed.zero?
      carriages.delete(carriage)
    else
      puts 'Stop before'
    end
  end

  def validate!
    super
    raise 'Number atleast 5 symbols' if number.to_s.length < 5
    true
  end

  def carriages_move
    @carriages.each do |carriage|
      yield(carriage)
    end
  end
end
