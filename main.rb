require_relative 'app'

def main
  app = App.new

  puts 'Welcome to School Library App!'

  options = {
    'List all books' => :list_books,
    'List all people' => :list_people,
    'Create a person' => :create_person,
    'Create a book' => :create_book,
    'Create a rental' => :create_rental,
    'List all rentals for a given person id' => :list_rentals_by_person_id,
    'Exit' => :exit
  }

  loop_method(app, options)
end

def loop_method(app, options)
  loop do
    option = get_menu_option(options)
    method = options[option]
    if method == :exit
      puts 'Thank you for using this app!'
      break
    else
      app.send(method)
    end
  end
end

def get_menu_option(options)
  puts 'Please choose an option by entering a number:'
  options.each_with_index { |(option, _), index| puts "#{index}) #{option}" }

  option = gets.chomp.to_i
  if option >= 0 && option < options.size
    options.keys[option]
  else
    puts 'That is not a valid option'
    get_menu_option(options)
  end
end
main
