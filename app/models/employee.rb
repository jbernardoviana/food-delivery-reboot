class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def manager?
    @role == "manager"
  end

  def self.headers
    %w(id username password role)
  end

  def to_csv
    [@id, @username, @password, @role]
  end

end
