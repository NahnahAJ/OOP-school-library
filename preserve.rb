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
      if person.instance_of?('Student')
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
end
