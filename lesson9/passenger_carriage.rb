class PassengerCarriage < Carriage
  attr_accessor :taked_seats
  attr_reader :number_of_seats

  def initialize(number_of_seats)
    super('passenger')
    @number_of_seats = number_of_seats.to_i
    @taked_seats = 0
  end

  def take_a_seat
    self.taked_seats += 1 if taked_seats < number_of_seats
  end

  def empty_seats
    number_of_seats.to_i - self.taked_seats.to_i
  end
end
