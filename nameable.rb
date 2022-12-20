# Interface
# Create a class Nameable.
# Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, 'Please implement the Nameable#correct_name method'
  end
end
