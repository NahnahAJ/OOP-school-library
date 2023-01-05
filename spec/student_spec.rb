require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(24, "ruby class", true)
  end

  describe "#studentAge" do 
    it "should return the age of the student" do
      expect(@student.age).to eql 24
    end
  end

  describe "#studentClass" do 
    it "should return the class of the student" do
      expect(@student.classroom).to eql "ruby class"
    end
  end

  describe "#parent_permission" do 
    it "should return the permission status of the student" do
      expect(@student.parent_permission).target == true
    end
  end

  describe "#play_hooky" do
    it "should return the play hooky status of the student" do
      expect(@student.play_hooky).to eql '¯(ツ)/¯'
    end
  end

  describe '#classroom contents' do
  let(:classroom) { double('classroom', students: []) }
    it 'sets the classroom attribute' do
      @student.classroom = classroom
      expect(@student.classroom).to eq(classroom)
    end

    it 'adds students to the array of the classroom' do
      @student.classroom = classroom
      expect(classroom.students).to include(@student)
    end

    it 'does not add the @student to the students array if the @student is already present' do
      @student.classroom = classroom
      expect(classroom.students.count).to eq(1)
    end
  end
end