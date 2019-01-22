class EmployeesView

  def display(employees)
    employees.each do |employee|
      puts "#{employee.id} #{employee.username} - #{employee.role}"
    end
  end

end
