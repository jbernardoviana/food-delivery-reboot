require_relative "../views/meals_view"

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  # As a user I should be able to list meals
  # As a user I should be able to create a meal

  def list
    display_meals
  end

  def create
    # ask user for name and price
    name = @meals_view.ask_for_stuff(:name)
    price = @meals_view.ask_for_stuff(:price).to_i
    # create instace of meal
    meal = Meal.new(name: name, price: price)
    # add it to the repo
    @meal_repository.add(meal)
    display_meals
  end

  private

  def display_meals
    # Fetch meals from the repo
    meals = @meal_repository.all
    # display them to the view
    @meals_view.display(meals)
  end


end
