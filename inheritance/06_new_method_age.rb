# Write a method called age that calls a private method to calculate 
# the age of the vehicle
# Make sure the private method is not available from outside the class

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle  
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0    # 1

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles        # 2
    @@number_of_vehicles
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas pedal and accelerate #{number} kmph."
  end

  def break(number)
    @current_speed -= number
    puts "You push the break and decelerate #{number} kmph."
  end

  def current_speed
    puts "You are now going #{@current_speed} kmph"
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles) #self tells us its a class method
    puts "#{miles/gallons} miles per gallon of gas."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def age
    puts "Your #{model} is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year.to_i  # the year of the model below is a string, we need to to_i
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4   # 2
  def to_s
    "My car is a #{color}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle    # 3
include Towable
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color}, #{year}, #{model}!"
  end
end

my_car = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck = MyTruck.new('2021', 'Ford Raptor', 'blue')

my_car.age