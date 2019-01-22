require "csv"
require "byebug"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file_path = csv_file
    @employees = []

    @next_id = 1

    load_csv if File.exists?(@csv_file_path)
  end

  def all
    return @employees
  end

  def find(id)
    @employees.find { |element| element.id == id }
  end

  def find_by_username(username)
    @employees.find { |element| element.username == username }
  end

  # def add(employee)
  #   employee.id = @next_id
  #   @employees << employee
  #   @next_id += 1
  #   save
  # end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row is a Hash
      # convert String to Integer
      row[:id] = row[:id].to_i

      # for each line of the CSV create an instance of Meal and push it to the array @employees
      @employees << Employee.new(row)
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1

  end

  # def save
  #   CSV.open(@csv_file_path, "wb") do |csv|
  #     csv << Employee.headers
  #     @employees.each do |employee|
  #       csv << employee.to_csv
  #     end
  #   end

  # end

end
