require 'spec_helper'

describe Rental do
  before :each do
    book = Book.new('Title', 'Author')
    person = Person.new(26, 'Kawsar ')
    @rental = Rental.new('2023/01/05', book, person)
  end

  describe '#new' do
    it 'should return a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#attributes' do
    it 'should return correct date' do
      expect(@rental.date).to eql '2023/01/04'
    end

    it 'should return correct book object' do
      expect(@rental.book).to be_an_instance_of Book
    end

    it 'should return correct person object' do
      expect(@rental.person).to be_an_instance_of Person
    end
  end
end