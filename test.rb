require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"
#require_relative "app/models/customer"


meal_repository = MealRepository.new("data/meals.csv")
p meal_repository.all

bitoque = Meal.new(price: 12, name: "bitoque")
peixe = Meal.new(price: 17, name: "peixe")

puts "Adding meals to the Repository"
meal_repository.add(bitoque)
meal_repository.add(peixe)
p meal_repository.all
