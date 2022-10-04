require_relative './customer'

class Account
  def self.profile(id_login)
    user__input = 0
    while user__input != "6"

      sub_menu = <<-SUB_MENU
      Welcome!!
      
      Enter 1 - To Check Balance
      Enter 2 - To Deposit
      Enter 3 - To Withdraw
      Enter 4 - To Transfer Money
      Enter 5 - To Open Passbook
      Enter 6 - To Logout
      Press Enter - MENU
      SUB_MENU

      puts sub_menu

      user__input = gets.chomp
      if @@status = 1
        case user__input
          when "1"  
            puts "Check Balance..."
            Customer.account_balance(id_login)

          when "2"  
            puts "Deposit...Enter Amount"  
            amount = gets.chomp.to_i
            Customer.deposit_balance(id_login, amount)

          when "3"   
            puts "Withdraw...Enter Amount" 
            amount = gets.chomp.to_i
            Customer.withdraw_balance(id_login, amount)
            
          when "4"  
            puts "Transfer Money...Enter Amount"
            amount = gets.chomp.to_i
            puts "Enter receiver's customer id"
            receiver_customer_id = gets.chomp
            Customer.transfer_balance(id_login, amount, receiver_customer_id)
            
          when "5"   
            puts "Open Passbook..." 
            Customer.passbook(id_login)
        
          when "6"   
            puts "Logout..." 

          else
            puts "Enter valid input"
        end

      else
        puts "Log in again"
      end  
    end 
  end
end

