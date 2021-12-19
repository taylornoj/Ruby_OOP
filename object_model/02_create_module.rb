# What is a module? What is its purpose? How do we use them 
# with our classes? Create a module for the class you created 
# in exercise 1 and include it properly.

# a module is a collection of behaviours that is usable in other classes
  # grouping reusable code in one place
# we use modules in our classes by using the include method, follwed by module name

module Study
end

class MyClass
  include Study
end

my_obj = MyClass.new


#########################


module Swimmable
end

class Person
  include Swimmable
end

first_person = Person.new



# name spacing

module Careers
  class Engineer
  end

  class Teacher
  end
end

first_job = Careers::Teacher.new     # prepend with Careers:: to instantiate an object
# helps us to organize our code a bit more