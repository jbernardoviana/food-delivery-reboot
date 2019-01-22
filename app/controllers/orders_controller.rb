require_relative "../views/orders_view"
require "byebug"

class OrdersController

  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository

    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    #1. Fetch all undelivered orders
    undelivered_orders = @order_repository.undelivered_orders
    #2. Display them
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(employee)

    undelivered_orders = @order_repository.undelivered_orders

    orders = undelivered_orders.select { |order| order.employee.id == employee.id }
    @orders_view.display(orders)
  end

  def mark_order_as_delivered(employee)
    list_my_orders(employee)
    order_index = @orders_view.ask_for_stuff(:id).to_i

    order = @order_repository.find(order_index)
    order.deliver!
    @order_repository.save

  end

  def list
    display_meals
  end

  def create
    # ask the user for a meal
    # ask the user for customer
    # ask the user an employee
    meal = ask_for_meal
    customer = ask_for_customer
    employee = ask_for_employee

    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(new_order)

    display_orders

  end

  def ask_for_meal
    meal_id = @orders_view.ask_for_meal_id.to_i
    @meal_repository.find(meal_id)
  end

  def ask_for_customer
    customer_id = @orders_view.ask_for_customer_id.to_i
    @customer_repository.find(customer_id)
  end

  def ask_for_employee
    employee_id = @orders_view.ask_for_employee_id.to_i
    @employee_repository.find(employee_id)
  end



  private

  def display_orders
    # Fetch meals from the repo
    orders = @order_repository.all
    # display them to the view
    @orders_view.display(orders)
  end


end
