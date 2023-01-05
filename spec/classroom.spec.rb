require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('A001')
  end

  describe '#new' do
    it 'takes one arguement and returns a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'should return the correct label' do
      expect(@classroom.label).to eql 'A001'
    end
  end

  describe '#students' do
    it 'should return an array' do
      expect(@classroom.students).to be_a Array
    end
  end

  describe '#add_student' do
    it 'should return a non-empty array' do
      student = Student.new(22, @classroom, 'Farah Amini')
      @classroom.add_student(student)
      expect(@classroom.students.empty?).to be false
    end
  end
end