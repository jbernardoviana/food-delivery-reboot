# TODO: implement the router of your app.
require "byebug"
class Router

  def initialize(controllers)
    @meals_controller = controllers[:meals]
    @customers_controller = controllers[:customers]
    @employees_controller = controllers[:employees]
    @sessions_controller = controllers[:sessions]

    @running = true
  end


  def run
    while @running
      @current_user = @sessions_controller.sign_in
      # stop the loop if :wrong_credentials
      stop if @current_user == :wrong_credentials
      # byebug
      while @current_user.class.to_s == "Employee"
        if @current_user.manager?
          puts "MANAGER"
          choice = display_manager_menu
          print `clear`
          action(choice, @current_user)
          # byebug
        else
          # byebug
          puts "DELIVERY GUY"
          choice = display_delivery_guy_menu
          print `clear`
          action(choice, @current_user)
        end
      end



      # 1. check if employee = @sessions_controller.sign_in
      # 2. check if employee.manager?

    end
  end

  private

  def stop
    @running = false
  end

  def display_manager_menu
    puts "------------WELCOME TO FOOD DELIVERY ----------"
    puts "-----------------------MENU--------------------"
    puts "1 - List Meals"
    puts "2 - Add Meal"
    puts "3 - List Customers"
    puts "4 - Add Customers"
    puts "5 - List Employees"
    puts "0 - Exit"
    print ">"
    gets.chomp.to_i
  end

  def display_delivery_guy_menu
    puts "------------WELCOME TO FOOD DELIVERY ----------"
    puts "-----------------------MENU--------------------"
    puts "1 - List Meals"
    puts "2 - Check Undelivered Orders"
    puts "3 - Mark order as delivered"
    puts "4 - List Customers"
    puts "0 - Exit"
    print ">"
    gets.chomp.to_i
  end

  def action(choice, user)
    if user.manager?
      case choice
      when 1 then @meals_controller.list
      when 2 then @meals_controller.create
      when 3 then @customers_controller.list
      when 4 then @customers_controller.create
      when 5 then @employees_controller.list
      when 0 then
        @running = false
        @current_user = @sessions_controller.destroy_session

      else
        puts "Wrong Option ..."
      end
    else
      case choice
      when 1 then @meals_controller.list
      when 2 then @customers_controller.list
      when 3 then @employees_controller.list
      # MARK ORDER AS DELIVERED
      # SEE UNDELIVERED ORDERS
      when 0 then
        @running = false
        @current_user = @sessions_controller.destroy_session
      else
        puts "Wrong Option ..."
      end
    end
  end





end
