# Create a class Rental with the following:
# @date instance variable, should be initialized in the constructor.
# Setter and getter for @date (remember about attr_accessor).

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end
