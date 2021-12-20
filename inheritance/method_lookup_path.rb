module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

# added after initial execution because fido.swim was throwing error
class GoodDog < Animal   # inherits from Animal
  include Swimmable      # mixin Swimmable module
  include Climbable      # mixin Climable module
end


puts "---Animal method lookup---"
puts Animal.ancestors

# output is:
# ---Animal method lookup---
# Animal
# Walkable
# Object
# Kernel
# BasicObject

# this means that when we call a method of any Animal object, first Ruby looks
# in the Animal class, then the Walkable module, then the Object class...etc

fido = Animal.new
puts fido.speak                  # => I'm an animal, and I speak!

# for the below, Ruby looked for walk instance method in Animal, but didn't find it
# kept looking until Walkable module, executed it and stopped looking further
puts fido.walk                   # => I'm walking.


# for this example, Ruby traversed all the classes and modules and didn't find a 
# swim method so we get an error
puts fido.swim
# => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>

puts "---GoodDog method lookup---"
puts GoodDog.ancestors

# output is:
# ---GoodDog method lookup---
# GoodDog
# Climbable
# Swimmable
# Animal
# Walkable
# Object
# Kernel
# BasicObject

# the order in which we include modules is important
# Ruby looks at the last module we included first
# In the rare occurence that the modules we mixin contain a method with the same name,
# the last module included will be consulted first