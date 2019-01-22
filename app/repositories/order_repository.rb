require "csv"
require "byebug"
require_relative "../models/order"

class OrderRepository

  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file

    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []

    @next_id = 1

    load_csv if File.exists?(@csv_file_path)
  end

  def undelivered_orders
    @orders.reject { |element| element.delivered? }
  end

  def all
    return @orders
  end

  def find(id)
    @orders.find { |element| element.id == id }
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a Hash
      # convert String to Integer
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == "true"

      # for each line of the CSV create an instance of order and push it to the array @orders
      @orders << Order.new(row)

    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1

  end

  def save
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << Order.headers
      @orders.each do |order|
        csv << order.to_csv
      end
    end

  end

end
