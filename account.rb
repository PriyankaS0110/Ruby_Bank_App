require_relative '../Bank/customer.rb'

class Account
  def self.profile
    action = 0

    puts"""Welcome
    Select your task here
    Enter 1 - To Check Balance
    Enter 2 - To Deposit
    Enter 3 - To Withdraw
    Enter 4 - To Transfer Money
    Enter 5 - To Open Passbook
    Enter 6 - To Logout
    Press Enter - MENU"""

    while action != "6"
      action = gets.chomp
      if @@status = 1
        case action
          when "1"  
            puts "Check Balance..."
            Customer.account_balance($login_with_id )   

          when "2"  
            puts "Deposit...Enter Amount"  
            amount = gets.chomp.to_i
            Customer.deposit_balance($login_with_id, amount)

          when "3"   
            puts "Withdraw...Enter Amount" 
            amount = gets.chomp.to_i
            Customer.withdraw_balance($login_with_id, amount)
            
          when "4"  
            puts "Transfer Money...Enter Amount"
            amount = gets.chomp.to_i
            puts "Enter receiver's customer id"
            receiver_cust_id = gets.chomp
            Customer.transfer_balance($login_with_id, amount, receiver_cust_id)
            
          when "5"   
            puts "Open Passbook..." 
            Customer.passbook($login_with_id)
        
          when "6"   
            puts "Logout..." 

          else
            puts """Kindly Enter Valid Input
            Enter 1 - To Check Balance
            Enter 2 - To Deposit
            Enter 3 - To Withdraw
            Enter 4 - To Transfer Money
            Enter 5 - To Open Passbook
            Enter 6 - To Logout
            Press Enter - MENU"""
        end

      else
        p "Log in again"
      end  
    end 
  end
end

