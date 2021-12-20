# Create a module that you can mix in to ONE of your sublclasses that describes
# a behaviour unique to that subclass


module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle  
  attr_accessor :color
  attr_reader :year
  attr_reader :model

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


puts my_car.can_tow?(500)  # returns error because module is not mixin to MyCar

puts my_truck.can_tow?(1000)  # returns true, my_truck and under 2000lbs

puts my_truck.can_tow?(4000)   # returns false, my_truck however over 2000lbs