require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'station.rb'

def trains
  @trains ||= {}
end

def carriages
  @carriages ||= {}
end

def stations
  @stations ||= {}
end

def create_a_station
  puts 'Enter name of station'
  name = gets.chomp
  stations[name] = Station.new(name)
end

def create_a_passenger_train
  begin
    puts 'Enter name of train'
    name = gets.chomp
    trains[name] = PassengerTrain.new(name)
  rescue StandardError => e
    puts e.message
    retry
  end
  puts trains[name]
end

def create_a_cargo_train
  begin
    puts 'Enter name of train'
    name = gets.chomp
    trains[name] = CargoTrain.new(name)
  rescue StandardError => e
    puts e.message
    retry
  end
  puts trains[name]
end

def add_a_carriage
  puts 'Enter name of train'
  name = gets.chomp
  if trains[name].type == 'passenger'
    puts 'Enter number of seats'
    seats = gets.chomp
    passenger_carriage = PassengerCarriage.new(seats)
    trains[name].carriages << passenger_carriage
    carriages[passenger_carriage.name.to_i] = passenger_carriage
  else
    puts 'Enter number of volume'
    volume = gets.chomp
    cargo_carriage = CargoCarriage.new(volume)
    trains[name].carriages << cargo_carriage
    carriages[cargo_carriage.name.to_i] = cargo_carriage
  end
end

def delete_carriage
  puts 'Enter name of train'
  name = gets.chomp
  trains[name].carriages.shift
end

def take_train
  puts 'Enter name of station'
  station_name = gets.chomp
  puts 'Enter name of train'
  train_name = gets.chomp
  stations[station_name].get_train(trains[train_name])
end

def see_trains
  puts ''
  trains.each do |name, train|
    puts "#{name} has #{train.carriages.count} carriages:"
    train.carriages.each do |carriage|
      puts "carriage name is: #{carriage.name}"
      if carriage.type == 'passenger'
        puts "Empty seats is #{carriage.empty_seats}"
        puts "Taked seats is #{carriage.taked_seats}"
      else
        puts "Empty volume is #{carriage.empty_volume}"
        puts "Taked volume is #{carriage.used_volume}"
      end
    end
  end
  puts ''
end

def see_stations
  stations.each do |name, station|
    puts "On station #{name}:"
    station.trains.each do |train|
      puts train.number
      puts train.type
      puts train.carriages.count
    end
  end
end

def take_seat
  puts 'Enter a number of carriage'
  name = gets.chomp.to_i
  carriages[name].take_a_seat
  puts "Number of empty seats is #{carriages[name].empty_seats}"
end

def take_volume
  puts 'Enter a number of carriage'
  name = gets.chomp.to_i
  puts 'Enter a volume'
  volume = gets.chomp.to_i
  carriages[name].take_a_volume(volume)
  puts "Empty volume is #{carriages[name].empty_volume}"
end

def actions
  @actions ||= {
    '1' => 'create_a_station',
    '2' => 'create_a_passenger_train',
    '3' => 'create_a_cargo_train',
    '4' => 'add_a_carriage',
    '5' => 'delete_carriage',
    '6' => 'take_train',
    '7' => 'see_trains',
    '8' => 'see_stations',
    '9' => 'take_seat',
    '10' => 'take_volume'
  }
end

loop do
  puts '
    Enter 1 to create station
    Enter 2 to create passenger train
    Enter 3 to create cargo train
    Enter 4 to add carriage to train
    Enter 5 to delete carriage from train
    Enter 6 to send train to station
    Enter 7 to see trains
    Enter 8 to see stations
    Enter 9 to take_a_seat
    Enter 10 to take a volume
    Enter 0 to exit
  '
  input = gets.chomp.to_s
  break if input == '0'
  eval(actions[input])
end
