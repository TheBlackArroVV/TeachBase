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
    self.register_instance
    validate!
  end

  def get_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def trains_by_type(type)
    self.trains.each do |train|
      if train.type == type
        puts train
      end
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Name can`t be blank" if name.nil?
    raise "Name must be atleast 6 symbols" if name.to_s.length < 6
    true
  end

  def trains_move(&block)
    @trains.each do |train|
      yield(train)
    end
  end
end
