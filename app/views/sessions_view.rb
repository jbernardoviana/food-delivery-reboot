class SessionsView

  def ask_for_stuff(symbol)
    puts "#{symbol.capitalize}?"
    print "> "
    gets.chomp
  end

  def welcome_user(user)
    puts "Welcome! #{user.username}!"
  end

end
