# Override the to_s method to create a user friendly print out
# of your object

class MyCar
 
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def initialize(year, color, model)
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

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles) #self tells us its a class method
    puts "#{miles/gallons} miles per gallon of gas."
  end

  def to_s
    "My car is a #{color}, #{year}, #{model}!"
  end
end

my_car = MyCar.new("2010", "silver", "Ford Focus")
puts my_car # => My car is a silver, 2010, Ford Focus.

