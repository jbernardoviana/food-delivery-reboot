require_relative "../views/customers_view"

class CustomersController

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  # As a user I should be able to list customers
  # As a user I should be able to create a meal

  def list
    display_customers
  end

  def create
    # ask user for name and price
    name = @customers_view.ask_for_stuff(:name)
    address = @customers_view.ask_for_stuff(:address)
    # create instace of meal
    customer = Customer.new(name: name, address: address)
    # add it to the repo
    @customer_repository.add(customer)
    display_customers
  end

  private

  def display_customers
    # Fetch customers from the repo
    customers = @customer_repository.all
    # display them to the view
    @customers_view.display(customers)
  end


end
