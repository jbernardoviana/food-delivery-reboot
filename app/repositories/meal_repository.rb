require "csv"
require "byebug"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file_path = csv_file
    @meals = []

    @next_id = 1

    load_csv if File.exists?(@csv_file_path)
  end

  def all
    return @meals
  end

  def find(id)
    @meals.find { |element| element.id == id }
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a Hash
      # convert String to Integer
      row[:id] = row[:id].to_i
      # convert String to Integer
      row[:price] = row[:price].to_i

      # for each line of the CSV create an instance of Meal and push it to the array @meals
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1

  end

  def save
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << Meal.headers
      @meals.each do |meal|
        csv << meal.to_csv
      end
    end

  end

end
