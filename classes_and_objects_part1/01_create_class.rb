# Create a class called MyCar

# When you initialize a new instance/object of the class, allow the 
# user to define some instance variables that tell us year, color and model

# Create an instance variable set to 0 during instantiation of the object
# to track the current speed

class MyCar

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  # create instance methods that allow the car to speed up, break and shut off the car

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



end


raptor = MyCar.new(2021, 'blue', 'Ford Raptor')
raptor.speed_up(25)
raptor.break(15)
raptor.current_speed
raptor.shut_off
raptor.current_speed