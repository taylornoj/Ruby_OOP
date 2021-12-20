# extracting common methods to a superclass, is a great way to model concepts
# that are naturally hierarchical

# Animal (superclass)
  # Fish (subclass)
  # Mammal (subclass)
    # Cat
    # Dog

# above is example of pure class based inheritance
# the goal of this is to put the right behaviour in the right class so we don't need to repeat code

# so the Fish objects are all related to animals living in water and therefore
# may have a swim method

# Mammal objects might have a method called warm_blooded? and have it return true
# therefore Dog and Cat will have access to the warm_blooded? method but they won't have access
# to the methods in the Fish class

# But some mammals can swim...
# we don't want to create another swim method in Dog because that violates DRY
# instead we can group them into a module and then mix in that module to the class
# that requires that behaviour:
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>

# Fish and Dog objects can swim, but objects of other classes won't be able to


# so when to use class inheritance vs. mixins?
  # Things to consider:
    # you can only subclass (class inheritance) from one class 
    # you can mix in as many modules (interface inheritance) as you'd like

    # if there's an 'is-a' relationship, class inheritance is usually the correct
    # choice
    # if there's a 'has-a' relationship, interface inheritance is generally a better choice
      # ex. dog "is an" animal and it "has an" ability to swim

    # you cannot instantiate modules (no object can be created from a module)
    # modules are used only for namespacing and grouping common methods together