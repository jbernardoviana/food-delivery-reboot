class CustomersView

  def display(customers)
    customers.each do |customer|
      puts "#{customer.name} - #{customer.address}"
    end
  end

  def ask_for_stuff(symbol)
    puts "#{symbol.capitalize} ?"
    gets.chomp
  end

end
