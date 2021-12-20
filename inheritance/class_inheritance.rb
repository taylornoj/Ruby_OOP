# INHERITANCE
# when a class inherits behaviour from another class

# the class that is inheriting behaviour is called the subclass and the 
# class it inherits from is called the superclass

# we use inheritance as a way to extract common behaviours from classes that
# share that behaviour and move it to a superclass

# below we are extracting the speak method to a superclass, Animal
# we then use that inheritance to make the behaviour available
# to GoodDog and Cat classes

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!

# the < symbol signifies that GoodDog is inheriting from the Animal class

# what if we want to use the original speak method from the GoodDog class only

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!

# In the GoodDog class, we're overriding the speak method in Animal
# Ruby checks the object's class first for the method before it looks 
# at the superclass