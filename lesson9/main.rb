require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'station.rb'

stations = {}
trains = {}
carriages = {}

loop do
  puts 'Enter 1 to create station'
  puts 'Enter 2 to create passenger train'
  puts 'Enter 3 to create cargo train'
  puts 'Enter 4 to add carriage to train'
  puts 'Enter 5 to delete carriage from train'
  puts 'Enter 6 to send train to station'
  puts 'Enter 7 to see trains'
  puts 'Enter 8 to see stations'
  puts 'Enter 9 to take_a_seat'
  puts 'Enter 10 to take a volume'
  puts 'Enter 0 to exit'
  input = gets.chomp.to_i
  case input
  when 0
    break
  when 1
    puts 'Enter name of station'
    name = gets.chomp
    stations[name] = Station.new(name)
  when 2
    begin
      puts 'Enter name of train'
      name = gets.chomp
      trains[name] = PassengerTrain.new(name)
    rescue StandardError => e
      puts e.message
      retry
    end
    puts trains[name]
  when 3
    begin
      puts 'Enter name of train'
      name = gets.chomp
      trains[name] = CargoTrain.new(name)
    rescue StandardError => e
      puts e.message
      retry
    end
    puts trains[name]
  when 4
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
  when 5
    puts 'Enter name of train'
    name = gets.chomp
    trains[name].carriages.shift
  when 6
    puts 'Enter name of station'
    station_name = gets.chomp
    puts 'Enter name of train'
    train_name = gets.chomp
    stations[station_name].get_train(trains[train_name])
  when 7
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
  when 8
    stations.each do |name, station|
      puts "On station #{name}:"
      station.trains.each do |train|
        puts train.number
        puts train.type
        puts train.carriage.count
      end
    end
  when 9
    puts 'Enter a number of carriage'
    name = gets.chomp.to_i
    carriages[name].take_a_seat
    puts "Number of empty seats is #{carriages[name].empty_seats}"
  when 10
    puts 'Enter a number of carriage'
    name = gets.chomp.to_i
    puts 'Enter a volume'
    volume = gets.chomp.to_i
    carriages[name].take_a_volume(volume)
    puts "Empty volume is #{carriages[name].empty_volume}"
  end
end
