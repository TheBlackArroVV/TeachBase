require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'station.rb'

stations = []
trains = []
carriages = []

loop do
  puts "Enter 1 to create station"
  puts "Enter 2 to create train"
  puts "Enter 3 to create passenger train"
  puts "Enter 4 to create cargo train"
  puts "Enter 9 to see stations"
  puts "Enter 0 to exit"
  input = gets.chomp.to_i
  case input
  when 0
    break
  when 1
    puts "Enter name of station"
    stations << Station.new(gets.chomp)
  when 2
    name = gets.chomp
    type = gets.chomp
    trains << Train.new(name, type)
  when 3
    name = gets.chomp
    trains << PassengerTrain.new(name)
  when 4
    name = gets.chomp
    trains << CargoTrain.new(name)
  when 9
    puts ""
    stations.each do |station|
      puts station.name
    end
    puts ""
  end
end

# trains.each do |train|
  # puts train.number
# end
