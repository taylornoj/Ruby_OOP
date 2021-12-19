# modules are another way to achieve polymorphism in Ruby
# a module is a collection of behaviours that is usable in other classes via mixins
# a module is "mixed in" to a class using the include invocation (line 15, 19)

# lets say we want our GoodDog class to have a speak method, but we have other 
# classes that we want to use a speak method with too, here's how we do it:

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog             # create an obj by defining a class
  include Speak
end

class HumanBeing
  include Speak
end

# both the GoodDog object (sparky), as well as the HumanBeing object (bob), have
# access to the speak instance method
# This is possible through "mixing in" the module Speak

sparky = GoodDog.new        # instantiating the obj by using .new method to create an instance (aka an object)
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!

## METHOD LOOKUP CHAIN
# how does Ruby know where to look for that method?
# Ruby has a distinct lookup path that it follows each time a method is called

# We can use the ancestors method on any class to find out the method lookup chain:

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors

# output:

---GoodDog ancestors---
GoodDog
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject

# the Speak module is placed right in between our custom classes (GoodDog 
# and Human Being) and the Object class that comes with Ruby

# since the speak method is not defined in GoodDog class, the next place
# it looks is the Speak module