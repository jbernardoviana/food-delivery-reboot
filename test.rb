# An order is taken for a customer, containing a meal (to simplify things, let's say that an order can only contain one meal)
# and is then assigned to a given delivery guy.
# Finally, the Order model needs to record whether or not the meal has been delivered.

# Here's where our models link up. First, write the Order model class and its repository.

# Then, make sure that the following user stories are implemented in your program:

# X As a manager, I can view all the undelivered orders
# X As a manager, I can add an order for a customer and assign it to a delivery guy
# X As a delivery guy, I can view my undelivered orders
# As a delivery guy, I can mark an order as delivered



























# require_relative "app/models/meal"
# require_relative "app/repositories/meal_repository"
# #require_relative "app/models/customer"


# meal_repository = MealRepository.new("data/meals.csv")
# p meal_repository.all

# bitoque = Meal.new(price: 12, name: "bitoque")
# peixe = Meal.new(price: 17, name: "peixe")

# puts "Adding meals to the Repository"
# meal_repository.add(bitoque)
# meal_repository.add(peixe)
# p meal_repository.all
