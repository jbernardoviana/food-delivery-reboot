require "csv"
require "byebug"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file)
    @csv_file_path = csv_file
    @customers = []

    @next_id = 1

    load_csv if File.exists?(@csv_file_path)
  end

  def all
    return @customers
  end

  def find(id)
    @customers.find { |element| element.id == id }
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a Hash
      # convert String to Integer
      row[:id] = row[:id].to_i

      # for each line of the CSV create an instance of Meal and push it to the array @customers
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1

  end

  def save
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << Customer.headers
      @customers.each do |customer|
        csv << customer.to_csv
      end
    end

  end

end
