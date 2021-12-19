# CLASS VARIABLES

# Just like instance variables capture information related to specific
# instances of classes (ex objects), we can create variables for an entire
# class that are appropriately named Class Variables

# Class variables are created using two @ symbols like so: @@

class GoodDog
  @@number_of_dogs = 0 # class variable initialized to 0

  def initialize            # our constructor increments the number by 1 when we
    @@number_of_dogs += 1   # instantiate new object via .new method
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2




# but what if we want certain variables that we never want to change?
# create CONSTANTS
# Define a constant by using an upper case letter at beginning of the
# variable name (a lot of devs will put it all in uppercase)

# using constant DOG_YEARS to calculate age in dog years when we 
# created the object, sparky
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28




# THE to_s METHOD
# to_s instance method comes built into every class in Ruby

puts sparky      # => #<GoodDog:0x007fe542323320>

# ^ the puts method automatically calls to_s on its argument (sparky object)
# in other words, 'puts sparky' is equivalent to 'puts sparky.to_s'
# the return is the name of the objects class and an encoding of the object id

# puts method calls to_s for any argument that is not an array
# for an array, it writes on separate lines the result of calling to_s
# on each element of the array

# lets add a custom to_s method to our GoodDog class, overriding the default

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

puts sparky   # => This dog's name is Sparky and is 28 in dog years.

# another method 'p' thats very similar to puts, except it doesn't call to_s
# on its argument
# it calls another built in Ruby instance method called 'inspect'
# inspect method is very helpful for debugging purposes, so we don't want to 
# override it

p sparky         # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>

# so 'p sparky' is equivalent to 'puts sparky.inspect'

# another important attribute of the to_s method is that its also
# automatically called in string interpolation

irb :001 > arr = [1, 2, 3]
=> [1, 2, 3]
irb :002 > x = 5
=> 5
irb :003 > "The #{arr} array doesn't include #{x}."
=> The [1, 2, 3] array doesnt include 5.

# here, the to_s method is automatically called on the arr array
# obejct, as well as the x integer object

irb :001 > "#{sparky}"
=> "This dog's name is Sparky and it is 28 in dog years."




# MORE ABOUT SELF
# self can refer to different things depending on where it is used

# two clear use cases for self:
  # use self when calling setter methods from within the class
  # use self for class method definitions

  class GoodDog
    attr_accessor :name, :height, :weight
  
    def initialize(n, h, w)
      self.name   = n
      self.height = h
      self.weight = w
    end
  
    def change_info(n, h, w)
      self.name   = n
      self.height = h
      self.weight = w
    end
  
    def info
      "#{self.name} weighs #{self.weight} and is #{self.height} tall."
    end

    def what_is_self
      self
    end
  end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self
# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">

# from within the class, when an instance method uses self, it references
# the calling object (sparky)

# within the change_info method, calling self.name= acts the same as calling
# sparky.name= from outside the class

# another way to use self is when we're defining class methods:

class MyAwesomeClass
  def self.this_is_a_class_method
  end
end

# when self is prepended to a method definition, it is defining a class method
# our GoodDog class method defined a class method called self.total_number_of_dogs
# which returned the value of the class variable @@number_of_dogs

# from within a class...

  # self, inside of an instance method, references the instance (object)
  # that called the method - the calling objects
  # therefore, self.weight= is the same as sparky.weight=

  # self, outside of an instance method, references the class and can be
  # used to define class methods
  # therefore, if we were to define a name class method, def self.name=(n)
  # is the same as def GoodDog.name(n)

# Therefore, we can see that self is a way of being explicit about what our 
# program is referencing and what our intentions are as far as behaviour

# self changes depending on the scope it is used in