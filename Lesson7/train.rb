require_relative "manufacturer.rb"
require_relative "instance_counter.rb"

class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :number
  attr_reader :type
  attr_accessor :speed
  attr_accessor :carriages

  REG_EXP = /^[a-z0-9]{3}[-]*[a-z0-9]{2}$/

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
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Number can`t be nil" if number.nil?
    raise "Number atleast 5 symbols" if number.to_s.length < 5
    raise "Type can`t be nil" if type.nil?
    raise "Not in regexp" if number !~ REG_EXP
    true
  end

  def carriages_move(&block)
    @carriages.each do |carriage|
      yield(carriage)
    end
  end
end
