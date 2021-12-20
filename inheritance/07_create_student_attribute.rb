# Create a class 'Student' with attributes name and grade
# do NOT make the grade getter public
# Create a better_grade_than? method

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts joe.better_grade_than?(bob)    # => true
puts joe.grade   # => this will throw an error because we can't call it outside of the class