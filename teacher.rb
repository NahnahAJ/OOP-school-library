# Create class Teacher with the following:
# Inherits from Person.
# Constructor extends parent's constructor by adding @specialization and a parameter for it.
# Override can_use_services? so it always returns true.

class Teacher < Person
  attr_reader :specialization
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
