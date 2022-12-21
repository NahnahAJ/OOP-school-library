class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @classroom = []
  end

  def add_student(classroom, student)
    @classroom.push(student) unless classroom.include?(student)
  end
end
