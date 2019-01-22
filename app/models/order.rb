# An order is taken for a customer, containing a meal (to simplify things, let's say that an order can only contain one meal)
# and is then assigned to a given delivery guy.
# Finally, the Order model needs to record whether or not the meal has been delivered.

class Order
  attr_accessor :id, :meal, :employee, :customer, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    %w(id meal_id customer_id employee_id delivered)
  end

  def to_csv
    [@id, @meal.id, @customer.id, @employee.id, @delivered]
  end

end

