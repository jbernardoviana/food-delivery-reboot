# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"

require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"

require_relative "app/repositories/employee_repository"
require_relative "app/controllers/employees_controller"

require_relative "app/controllers/sessions_controller"

require_relative "router"

MEALS_CSV = "data/meals.csv"
CUSTOMERS_CSV = "data/customers.csv"
EMPLOYEES_CSV = "data/employees.csv"

meal_repository = MealRepository.new(MEALS_CSV)
customer_repository = CustomerRepository.new(CUSTOMERS_CSV)
employee_repository = EmployeeRepository.new(EMPLOYEES_CSV)


meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
employees_controller = EmployeesController.new(employee_repository)
sessions_controller = SessionController.new(employee_repository)

controllers = {
  customers: customers_controller,
  meals: meals_controller,
  employees: employees_controller,
  sessions: sessions_controller
}

router = Router.new(controllers)
router.run

