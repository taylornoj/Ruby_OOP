# METHOD ACCESS CONTROL

# implemented through the use of access modifiers
  # purpose of access modifiers is to allow or restrict access to a particular thing
  # in Ruby, these things that we are concerned with restricting access to are 
    # methods defined in a class

# Method Access Control is implemented in Ruby through the use of public, private
# and protected access modifiers

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years    # this is private method
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years

NoMethodError: private method `human_years' called for
  #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>`
  # private methods are not accessible outside of the class definition and are only 
  # accessible from inside the class when called without self
  
  
# all methods in GoodDog class (before above refactor) are PUBLIC methods
  # public method is a method that is available to anyone who knows either the class
  # name or the objects name
  # the rest of the program can use the methods

# sometimes you'll have methods that are doing work in the class but don't need
# to be available to the rest of the program
  # these methods would be PRIVATE

# PUBLIC and PRIVATE methods are most common, but in some less common situations,
# we'll want an in-between approach
# we can use PROTECTED method to create protected methods
  # use these two rules to help understand:
    # from inside the class, protected methods are accessible just like public methods
    # from outside the class, protected methods act just like private methods
# examples:

class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
puts fido.a_public_method        # => Will this work? Yes, I'm protected!

# we can call a protected method from within the class, even with self prepended 

# but outside of the class?
fido.a_protected_method
  # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>

# the above demonstrates the second rule, that we can't call protected methods from
# outside of the class