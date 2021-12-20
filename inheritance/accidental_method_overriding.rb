# every class you create inherently subclasses from class Object
  # the object class is built into Ruby

  class Parent
    def say_hi
      p "Hi from Parent."
    end
  
  
  Parent.superclass       # => Object

# methods defined in the Object class are available in all classes

# a subclass can override a superclasses method

class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi         # => "Hi from Child."

# if you accidentally override a method that was originally defined in
# the Object class, it can have far reaching effects on your code
  # for example, send is an instance method that all classes inherit from Object
  # if you defined a new send instance method in your class, all objects of your
  # class will call your custom send method instead of the one in class Object

  # the one object instance method that easily overridden without any major
  # side effects is to to_s method

