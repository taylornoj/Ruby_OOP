# instance methods

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak      # method
    "Arf!"
  end
  # could also have this instead:
  def speak
    "#{@name} says arf!"
  end

end

sparky = GoodDog.new("Sparky")     # GoodDog object
sparky.speak

puts sparky.speak           # => Arf!

fido = GoodDog.new("Fido")          # GoodDog object
puts fido.speak             # => Arf!

# all objects of the sme class hvae the same behaviours, though
# they contain different states; differing state is the name

# the 'instead' case results:
puts sparky.speak           # => "Sparky says arf!"
puts fido.speak             # => "Fido says arf!"
