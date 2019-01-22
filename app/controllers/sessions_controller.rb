require_relative "../views/sessions_view"

class SessionController

  def initialize(employee_repo)
    @employee_repo = employee_repo
    @sessions_view = SessionsView.new
    @user = nil
    #@counter = 1
  end

  def sign_in(counter = 1)
    # 1. Ask for username
    username = @sessions_view.ask_for_stuff(:username)
    # 2. Ask for password
    password = @sessions_view.ask_for_stuff(:password)
    # 3. Check if the employee (user) is on the DB
    @user = @employee_repo.find_by_username(username)
    # 4. Check if password matches
    if @user && @user.password == password
      @sessions_view.welcome_user(@user)
      @user
    else
      # retry count (3 times)
      counter += 1
      counter <= 3 ? sign_in(counter) : :wrong_credentials
    end
    # 5. if it matches welcome the employee and return object
  end


  def destroy_session
    nil
  end
end
