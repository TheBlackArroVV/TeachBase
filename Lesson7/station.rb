class Station
  include InstanceCounter

  attr_reader :name
  attr_reader :trains

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

  def valid?
    validate!
  rescue StandardError
    false
  end

  def validate!
    raise 'Name can`t be blank' if name.nil?
    raise 'Name must be atleast 6 symbols' if name.to_s.length < 6
    true
  end

  def trains_move
    @trains.each do |train|
      yield(train)
    end
  end
end
