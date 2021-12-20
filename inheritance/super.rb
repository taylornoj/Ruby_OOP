# Ruby provides us with the super keyword to call methods earlier
# in the method lookup path

# when you call super from within a method, it searches the method
# lookup path for a method with the same name, then invokes it

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"

# above, we created a simple Animal class with a speak instance method
# we then created GoodDog which subclasses Anmial, also with a speak instance
# method to override the inherited version

# HOWEVER in the subclass' speak method we use super to invoke the speak method
# from the superclass (Animal) and then we extend the functionality
# by appending some text to the return value

# another common way of using super is with initialize:

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

# we are using super with no arguments 
# the initialize method in GoodDog takes an arguement (this is where super is being used)
# super automatically forwards the arguments that were passed to the method from which super is called
  # initialize method in GoodDog class
# super will pass the color argument and invoke it
  # this explains presence of @name="brown" when bruno instance is created



# when called with specific arguments (ex super(a, b)) the specified arguments will be sent
# up the method lookup chain:

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">

# now, super takes an argument, hence the passed in argument is sent to the superclass


# One last way - 
# if you call super(), it calls the method in the superclass with no arguments at all
# if you have a method in your superclass that takes no arguments, this is best

class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">