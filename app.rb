# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
#   List all books.
#   List all people.
#   Create a person (teacher or student, not a plain Person).
#   Create a book.
#   Create a rental.
#   List all rentals for a given person id.
#   In your main.rb define the entry point, this will be a method called main that is invoked at the end of your file. This method should do the following:
#   Present the user with a list of options to perform.
#   Lets users choose an option.
#   If needed, ask for parameters for the option.
#   Have a way to quit the app.

require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    if @people.length == 0
      puts "There are no people in the library"
    else
      @people.each do |person| 
        if person.class == Student
          puts "Student: #{person.name} (Id: #{person.id}, Age: #{person.age}, Parent Permission: #{person.parent_permission})"
        else
          puts "Teacher: #{person.name} (Id: #{person.id}, Age: #{person.age}, Specialization: #{person.specialization})"
        end
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    if person_type == '1'

      print 'Name: '
      name = gets.chomp

      print 'Age: '
      age = gets.chomp.to_i

      print 'Classroom:'
      classroom = Classroom.new(gets.chomp)

      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      if parent_permission == 'Y' || parent_permission.downcase == 'y'
        parent_permission = true
      elsif parent_permission == 'N' || parent_permission.downcase == 'n'
        parent_permission = false
      else
        puts 'Invalid input: please enter Y or N'
        return
      end

      @people << Student.new(age, classroom, name, parent_permission)
      puts 'Person created successfully'

    elsif person_type == '2'
      
      print 'Name: '
      name = gets.chomp

      print 'Age: '
      age = gets.chomp.to_i

      print 'Specialization: '
      specialization = gets.chomp

      @people << Teacher.new(age, specialization, name)
      puts 'Person created successfully'

    else
      puts 'Invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} " }

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each { | rental | puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
  end
end

def main
  app = App.new

  puts 'Welcome to School Library App!'

  options = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a given person id',
    'Exit'
  ]

  loop do
    puts 'Please choose an option by entering a number:'
    options.each_with_index { |option, index| puts "#{index}) #{option}" }

    option = gets.chomp.to_i

    case option
    when 0
      app.list_books
    when 1
      app.list_people
    when 2
      app.create_person
    when 3
      app.create_book
    when 4
      app.create_rental
    when 5
      app.list_rentals_by_person_id
    when 6
      puts 'Thank you for using this app!'
      break
    else
      puts 'That is not a valid option'
    end

    puts 'Press any key to continue'
    gets.chomp
  end
end

main