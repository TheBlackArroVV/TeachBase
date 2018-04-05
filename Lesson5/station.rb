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
end
