require './nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unkown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
