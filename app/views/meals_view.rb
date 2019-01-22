class MealsView

  def display(meals)
    meals.each do |meal|
      puts "#{meal.name} - #{meal.price}"
    end
  end

  def ask_for_stuff(symbol)
    puts "#{symbol.capitalize} ?"
    gets.chomp
  end

end
