# CLASS METHODS are methods we can call directly on the class itself,
# without having to instantiate any objects

# When defining a class method, we prepend the method name with
# the reserved word self. like this:


def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end

# Then when we call the class method, we use the class name GoodDog,
# followed by the method name, without even having to instantiate 
# any objects, like this:

GoodDog.what_am_i          # => I'm a GoodDog class!

# Class methods are where we put functionality that does not pertain
# to individual objects

# Objects contain state, and if we have a method that does not need to deal
# with states, then we can just use a class method