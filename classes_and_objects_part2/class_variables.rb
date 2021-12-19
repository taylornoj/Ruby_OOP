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

