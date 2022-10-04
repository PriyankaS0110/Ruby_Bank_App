require_relative './customer'
require_relative './validation'

user_input = 0

while user_input != "3"

  main_menu = <<-MAIN_MENU 

  How can we help you
    Enter 1 - Create Account
    Enter 2 - Login Account
    Enter 3 - Exit
  MAIN_MENU

  puts main_menu

  user_input = gets.chomp
  case user_input

  when "1"
    puts "Creating Account..."
    accepting_data = true

    while accepting_data == true
      
      puts "Enter First Name"
      fname = gets.chomp
      next unless Validation.is_a_valid_name(fname)

      puts "Enter Last Name"
      lname = gets.chomp
      next unless Validation.is_a_valid_name(lname)

      puts "Enter Email"
      mail = gets.chomp
      next unless Validation.is_a_valid_email(mail)

      puts "Enter Address"
      address = gets.chomp
      next unless Validation.is_a_valid_address(address)

      puts "Enter Password"
      password = gets.chomp
      next unless Validation.is_a_valid_password(password)

      puts "Thank You For the Info"
      accepting_data = false
      Customer.passing_data(fname,lname,mail,address,password)

    end
    
  when "2"
    puts "Enter your Credentials..."
    puts "Enter Customer ID"
    id_login = gets.chomp
    puts "Enter Password"
    password_login = gets.chomp
    Customer.log_in(id_login, password_login)

  when "3"
    puts "Bye Have a nice day..."
    
  else
    puts "its not working"
  end  
end 

