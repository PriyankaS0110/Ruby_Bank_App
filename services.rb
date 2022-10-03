require_relative '../Bank/customer.rb'

task = 0

puts"""How can we help you
  Enter 1 - Create Account
  Enter 2 - Login Account
  Enter 3 - Exit"""

while task != "3"
  task = gets.chomp
  case task

  when "1"
    puts "Creating Account..."
    Customer.get_account_data
    

  when "2"
    puts "Enter your Credentials..."
    puts "Enter Customer ID"
    customer_id_login = gets.chomp
    puts "Enter Password"
    customer_password_login = gets.chomp
    Customer.log_in(customer_id_login, customer_password_login)
    
  when "3"
      puts "Bye Have a nice day..."

  else
    puts """Kindly Enter Valid Input (1 , 2 , 3)
    Enter 1 - Create Account
    Enter 2 - Login Account
    Enter 3 - Exit"""
  end  
end 

