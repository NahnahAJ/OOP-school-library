# Create class Person with the following:
# Instance vars: @id, @name, and @age.
# Constructor with name, age, and parent_permission as parameter.
# name and parent_permission are optional and have default values of "Unknown" and true.
# Getters for @id, @name, and @age.
# Setters for @name and @age.
# Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
# Public method can_use_services? that returns true if person is of age or if they have permission from parents.

# Interface
# Create a class Nameable.
# Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, 'Please implement the Nameable#correct_name method'
  end
end

# Make sure that your Person class inherits from Nameable
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def
      initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # Make sure that this class has a method correct_name implemented. It should simply return the name attribute.
  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# Prepare base Decorator
# Make sure that it inherits from Nameable.
# In the constructor assign a nameable object from params to an instance variable.
# Implement the correct_name method that returns the result of the correct_name method of the @nameable.

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Prepare CapitalizeDecorator and TrimmerDecorator
# For the CapitalizeDecorator:
# Create a class that inherits from the base Decorator class.
class CapitalizeDecorator < BaseDecorator
  # Implement a method correct_name that capitalizes the output of @nameable.correct_name.
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# For the TrimmerDecorator:
# Create a class that inherits from the base Decorator class.
class TrimmerDecorator < BaseDecorator
  # Implement a method correct_name that makes sure that the output of @nameable.correct_name
  #  has a maximum of 10 characters. If it's longer it should trim the word.
  def correct_name
    correct_name = @nameable.correct_name
    correct_name = correct_name.slice(0, 10) if correct_name.length > 10
    correct_name
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
