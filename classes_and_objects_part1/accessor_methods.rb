# Accessor Methods

# what if we wanted to print out only sparky's name?

puts sparky.name

# but this won't work, we will get an error:
# NoMethodError: undefined method `name' for #<GoodDog:0x007f91821239d0 @name="Sparky">

# NoMethodError means that we called a method that doesn't exist or is 
# unavailable to the object

# the obejcts name is stored in the @name instance variable
# we have to create a method that will return the name

class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name      # getter method
    @name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name

# output:
Sparky says arf!
Sparky

# what if we wanted to change sparky's name?
# we reach for a setter method

class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)      # setter method
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = "Spartacus" # Ruby allows us to drop the () in this method
puts sparky.get_name

# output:
Sparky says arf!
Sparky
Spartacus

# Ruby devs tend to want to name those getter and setter methods
# using the same name as the instance variable they are exposing and setting

class GoodDog
  def initialize(name)
    @name = name
  end

  def name                  # This was renamed from "get_name"
    @name
  end

  def name=(n)              # This was renamed from "set_name="
    @name = n
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"

# this is where we can actually use the attr_accessor method instead
# then we can refactor our code:

class GoodDog
  attr_accessor :name  # takes symbol as an argument, which is uses to create
                       # the method name for the getter and setter methods
  def initialize(name)  
    @name = name   # what if we added two new states?
  end

  def speak
    "#{@name} says arf!"   # here you can remove the @ to call instance method instead to call the getter method
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"

# what if we want the getter method without the setter method?

# we would want to use the attr_reader method!
# only allows you to retrieve the instance variable
# if you only want the setter method, you can use attr_writer method

# all attr_* methods take a Symbol as parameters 

# if there are more states you are tracking you can use:
attr_accessor :name, :height, :weight
# refer back to line 104:
def change_info(n, h, w)
  @name = n
  @height = h
  @weight = w
end

# with some revisions, our GoodDog class now looks like this:
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.