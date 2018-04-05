class CargoCarriage < Carriage
  attr_reader :volume
  attr_accessor :used_volume

  def initialize(volume)
    super("cargo")
    @volume = volume
    @used_volume = 0
  end

  def take_a_volume(volume)
    self.used_volume += volume if (used_volume + volume) < self.volume
  end

  def empty_volume
    self.volume - self.used_volume
  end
end
