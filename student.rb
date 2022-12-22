# Create class Student with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @classroom and a parameter for it.
# Method play_hooky that returns "¯\(ツ)/¯".

require_relative 'classroom'
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
