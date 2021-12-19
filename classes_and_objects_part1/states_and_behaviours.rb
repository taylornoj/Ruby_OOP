# States and Behaviours

# when defining a class, we typically focus on two things:
  # states
    # track attributes for individual objects
  # behaviours
    # what objects are capable of doing

# instance methods in a class are available to objects (or instances) of that class
# instance methods expose behaviour for objects
# instance variables keep track of state

# we removed functionality from previous chapter:
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new        # => "This object was initialized!"

# instantiating a new GoodDog object triggered the
# initialize method and resulted in the string being outputted

# refer to the initialize method as a constructor because it gets
# triggered whenever we create a new object