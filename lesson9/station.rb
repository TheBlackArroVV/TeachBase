require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name
  attr_reader :trains

  validate :name, :presence

  @@stations = []

  def self.all
    puts @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def get_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.each do |train|
      puts train if train.type == type
    end
  end

  def validate!
    super
    raise 'Name must be atleast 6 symbols' if name.to_s.length < 6
    true
  end

  def trains_move
    @trains.each do |train|
      yield(train)
    end
  end
end
