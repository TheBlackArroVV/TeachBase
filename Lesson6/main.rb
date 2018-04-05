require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'carriage.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'station.rb'

stations = {}
trains = {}

loop do
  puts "Enter 1 to create station"
  puts "Enter 2 to create train"
  puts "Enter 3 to create passenger train"
  puts "Enter 4 to create cargo train"
  puts "Enter 5 to add carriage to train"
  puts "Enter 6 to delete carriage from train"
  puts "Enter 7 to send train to station"
  puts "Enter 8 to see trains"
  puts "Enter 9 to see stations"
  puts "Enter 0 to exit"
  input = gets.chomp.to_i
  case input
  when 0
    break
  when 1
    puts "Enter name of station"
    name = gets.chomp
    stations[name] = Station.new(name)
  when 2
    begin
      puts "Enter name of trains"
      name = gets.chomp
      puts "Enter type of train"
      type = gets.chomp
      trains[name] = Train.new(name, type)
    rescue Exception => e
      puts e.message
      retry
    end
    puts trains[name]
  when 3
    begin
      puts "Enter name of train"
      name = gets.chomp
      trains[name] = PassengerTrain.new(name)
    rescue Exception => e
      puts e.message
      retry
    end
    puts trains[name]
  when 4
    begin
      puts "Enter name of train"
      name = gets.chomp
      trains[name] = CargoTrain.new(name)
    rescue Exception => e
      puts e.message
      retry
    end
    puts trains[name]
  when 5
    puts "Enter name of train"
    name = gets.chomp
    trains[name].carriages << Carriage.new(trains[name].type)
  when 6
    puts "Enter name of train"
    name = gets.chomp
    trains[name].carriages.shift
  when 7
    puts "Enter name of station"
    station_name = gets.chomp
    puts "Enter name of train"
    train_name = gets.chomp
    stations[station_name].get_train(trains[train_name])
  when 8
    puts ""
    trains.each do |name, train|
      puts "#{name} has #{train.carriages.count} carriages"
    end
    puts ""
  when 9
    stations.each do |name, station|
      puts "On station #{name}:"
      station.trains.each do |train|
        puts train.number
      end
    end
  end
end
