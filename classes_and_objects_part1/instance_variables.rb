# create a new object and instantiate it with some state, like name

class GoodDog
  def initialize(name)
    @name = name
  end
end

# @name = an instance variable
# a variable that exists as long as the object instance exists and it is 
# one of the ways we tie data to objects

# it lives on to be referenced until object instance is destroyed


# create an object using GoodDog class:

sparky = GoodDog.new("Sparky")

# string "Sparky" is being passed from the new method through to the initialize 
# method, and is assigned to the local variable name
# within the constructor (initialize method) we then set the instance
# variable @name to name
  # results in assigning the string "Sparky" to the @name instance variable

# instance variables are responsible for keeping track of information about the 
# state of an object

