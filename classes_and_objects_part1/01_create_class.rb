# Create a class called MyCar
# When you initialize a new instance/object of the class, allow the 
# user to define some instance variables that tell us year, color and model
# create an instance variable set to 0 during instantiation of the object
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
  end

  def break(number)
  end

  def shut_off
  end

  

end



