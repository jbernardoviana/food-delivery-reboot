require_relative "../views/employees_view"

class EmployeesController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @employees_view = EmployeesView.new
  end

  def list
    display_employees
  end

  private

  def display_employees
    # Fetch meals from the repo
    meals = @employee_repository.all
    # display them to the view
    @employees_view.display(meals)
  end


end
