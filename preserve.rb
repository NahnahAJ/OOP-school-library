require_relative 'app'

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
      puts person.class
      if person('class') == 'Student'
        people_json.push({ type: person.class, name: person.name, age: person.age,
                           parent_permission: person.parent_permission })
      else
        people_json.push({ type: person.class, name: person.name, age: person.age,
                           parent_permission: person.parent_permission, specialization: person.specialization })
      end
    end

    @app.instance_variable_get(:@rentals).each do |rental|
      rentals_json.push({ Date: rental.date, Person: rental.person.name, Book: rental.book.title })
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
    puts books_json
    puts people_json
    puts rentals_json

    unless @app.books.empty?
      books_json.each do |book|
        @app.books.push(Book.new(book['Title'], book['Author']))
      end
    end

    unless @app.people.empty?
      people_json.each do |person|
        if person['type'] == 'Student'
          @app.people.push(Student.new(person['age'], 'Classroom', person['parent_permission'], person['name']))
        else
          @app.people.push(Teacher.new(person['age'], person['specialization'], person['name']))
        end
      end
    end

    return if @app.rentals.empty?

    rentals_json.each do |rental|
      @app.rentals.push(Rental.new(rental['Date'], rental['Book'], rental['Person']))
    end
  end
end
