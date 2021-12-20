# 1. Add a class variable to your superclass that can keep track of the number
# of objects created that inherit from the superclass

# 2. Create a method to print out the value of this class variable as well

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
  NUMBER_OF_DOORS = 2
  def to_s
    "My truck is a #{color}, #{year}, #{model}!"
  end
end

# will print 2
my_car = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck = MyTruck.new('2021', 'Ford Raptor', 'blue')

# adding these will print 4
my_car2 = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck2 = MyTruck.new('2021', 'Ford Raptor', 'blue')

puts Vehicle.number_of_vehicles