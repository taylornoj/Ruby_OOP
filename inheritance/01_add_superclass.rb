# 1. Create a superclass called Vehicle for your MyCar class to inherit from and move
# the behaviour that isn't specific to the MyCar class to the superclass

# 2. Create a constant in your MyCar class that stores information about the
# vehicle that makes it different from other types of Vehicles

# 3. Create a new class called MyTruck that inherits from your superclass that 
# also has a constant defined that separates it from the MyCar class in some way

class Vehicle  # 1
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color}, #{year}, #{model}!"
  end
end

my_car = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck = MyTruck.new('2021', 'Ford Raptor', 'blue')

puts my_car    # => My car is a silver, 2010, Ford Focus!
puts my_truck   # => My truck is a blue, 2021, Ford Raptor!

