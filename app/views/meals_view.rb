class MealsView

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} #{meal.name} - #{meal.price}"
    end
    puts "------------------------------------------------------"

  end

  def ask_for_stuff(symbol)
    puts "#{symbol.capitalize} ?"
    gets.chomp
  end

end
