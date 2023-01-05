require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(23, 'Math', 'Samim')
  end

  describe '#new' do
    it 'takes three arguements and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  describe '#attributes' do
    it 'should return correct age' do
      expect(@teacher.age).to eql 23
    end

    it 'should return correct specialization' do
      expect(@teacher.specialization).to eql 'Math'
    end

    it 'should return correct name' do
      expect(@teacher.name).to eql 'Samim'
    end
  end

  describe '#can_use_services?' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to be true
    end
  end

  describe 'Inheritance' do
    it 'should inherit from Person class' do
      expect(Teacher).to be < Person
    end
  end
end
