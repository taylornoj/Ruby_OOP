# Using modules for NAMESPACING

# namespacing means organizing similar classes under a module
  # modules group related classes

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

# we call classes in a module by appending the class name to the module name with ::

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"


# Using modules as a CONTAINER for methods
  # module methods

# using modules to house other modules - useful for methods that seem out of place

module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)
# or
value = Mammal::some_out_of_place_method(4) #** preferred way