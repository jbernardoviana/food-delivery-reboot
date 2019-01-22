class OrdersView

  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} #{order.customer.name} #{order.employee.username} #{order.delivered} "
    end
  end

  def ask_for_stuff(symbol)
    puts "#{symbol.capitalize} ?"
    gets.chomp
  end

  def ask_for_meal_id
    puts "Meal Id?"
    gets.chomp
  end

  def ask_for_customer_id
    puts "Customer Id?"
    gets.chomp
  end

  def ask_for_employee_id
    puts "Employee Id?"
    gets.chomp
  end

end
