require_relative 'app'
require_relative 'student'
require_relative 'person'

# Check the documentation for Ruby's JSON library.
# On exit from your app save all the data (books, people, and rentals)
# into JSON files. One per type of data you are storing and named accordingly (e.g. rentals.json)
# On startup of your app load all data from files.
# Remember to handle the case when one or more of the files are missing.

require 'json'
class Preserve
  def initialize(app)
    @app = app
  end

  # Save data to a file
  def save_data
    books_json = []
    people_json = []
    rentals_json = []

    @app.books.each { |book| books_json.push({ Title: book.title, Author: book.author }) }

    @app.instance_variable_get(:@people).each do |person|
      if person.instance_of?(Student)
        people_json.push({ type: person.class, name: person.name, age: person.age,
                           parent_permission: person.parent_permission, Id: person.id })
      else
        people_json.push({ type: person.class, name: person.name, age: person.age,
                           specialization: person.specialization, Id: person.id })
      end
    end

    @app.instance_variable_get(:@rentals).each do |rental|
      rentals_json.push({ Date: rental.date, Book: rental.book.title, Person: rental.person.name,
                          Id: rental.person.id })
    end
    File.write('data_files/books.json', JSON.generate(books_json))
    File.write('data_files/people.json', JSON.generate(people_json))
    File.write('data_files/rentals.json', JSON.generate(rentals_json))
  end

  # Load data from a file
  def load_data
    books_json = JSON.parse(File.read('data_files/books.json'))
    people_json = JSON.parse(File.read('data_files/people.json'))
    rentals_json = JSON.parse(File.read('data_files/rentals.json'))

    books_json.each { |book| @app.books.push(Book.new(book['Title'], book['Author'])) }

    people_json.each do |person|
      if person.instance_of?(Student)
        student = Student.new(person['age'], person['classroom'], person['parent_permission'], person['name'])
        student.id = person['Id']
        @app.people.push(student)
      else
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.id = person['Id']
        @app.people.push(teacher)
      end
    end

    rentals_json.each do |rental|
      new_book = get_book(rental['Book'])
      new_person = get_person(rental['Person'])

      @app.rentals.push(Rental.new(rental['Date'], new_book, new_person))
    end
  end

  def get_person(name)
    @app.people.find { |person| person.name == name }
  end

  def get_book(title)
    @app.books.find { |book| book.title == title }
  end
end
