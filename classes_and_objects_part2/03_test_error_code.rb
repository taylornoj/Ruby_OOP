# When we run the following code...

class Person
  attr_accessor :name
  #attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
puts bob.name
bob.name = "Bob"
puts bob.name

# We get the following error:


#test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)


# we get this error because attr_reader only creates a getter method

# when we try to reassign the name instance variable to "Bob", we need a 
# setter method called name=
# we can change attr_reader to attr_accessor or attr_writer

