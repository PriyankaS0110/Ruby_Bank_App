class Customer

  @@status = nil
  attr_accessor :id, :fname, :lname, :mail, :address, :password,  :account_number, :balance
  def initialize(id, fname,lname, mail, address, password, account_number , balance)
    @id = id
    @fname = fname
    @lname = lname
    @mail = mail
    @address = address
    @password = password
    @account_number = account_number
    @balance = balance
  end

  def self.add_account(account)
    @@account_list ||= {} 
    @@account_list[account.id] = account
  end

  def self.retrieve_account_data(id)
    @@account_list[id]
  end
  
  def self.log_in(id_login, password_login)
    cust = Customer.retrieve_account_data(id_login.to_s)
      if password_login == cust.password
        @@status = id_login
        puts "Login Successful"
        Account.profile(id_login)
      else
        puts "Try Again"
      end
  end

  def self.passing_data(fname,lname,mail,address,password) 
      @fname = fname 
      @lname = lname 
      @mail = mail
      @address = address
      @password = password

    @id = Validation.cust_id_generator
    @account_number= Validation.cust_acc_num
    @balance = 1000

    puts"""Account Created Successfully
      Your Customer Id -- #{@id}
      Your Customer Account Number -- #{@account_number}-
      Your Minimum balance is -- #{@balance}-
      Kindly login"""

    cust1 = Customer.new(@id, @lname, @fname, @mail, @address, @password, @account_number, @balance)
    Customer.add_account(cust1)
  end

  def self.account_balance(current_id)
    cust = Customer.retrieve_account_data(current_id)
    puts "Your account balance is -- #{cust.balance}"  
  end

  def self.deposit_balance(current_id, amount)
    cust = Customer.retrieve_account_data(current_id)
    puts "Enter the Amount you want to Deposit: "
    cust.balance += amount
    puts "your balance after deposit #{cust.balance}"
    puts "Deposit money successfully"

    passbook_entry = Transaction.new("1", current_id, "Deposit", amount, "time", "na")
    Passbook.add_entry(passbook_entry)
  end

  def self.withdraw_balance(current_id, amount)
    cust = Customer.retrieve_account_data(current_id)
    puts "Enter the Amount you want to withdraw: "
    if amount <= cust.balance
      cust.balance -= amount
      puts "your balance after withdraw #{ cust.balance}"
      if  cust.balance < 1000
        puts "Note: Your account has to have minimum Rs. 1000.00"
      end
      puts "withdraw money successfully"
      passbook_entry = Transaction.new("2", current_id, "Withdraw", amount, "time", "na")
      Passbook.add_entry(passbook_entry)
      
    else
      puts "sorry you have insufficient balance"
    end
  end

  def self.transfer_balance(current_id, amount, receiver_customer_id)
    sender_cust = Customer.retrieve_account_data(current_id)
    receiver_cust = Customer.retrieve_account_data(receiver_customer_id)
    if sender_cust.balance >= amount
      sender_cust.balance -= amount
      receiver_cust.balance += amount
      puts "transfer money successfully"
      passbook_entry = Transaction.new("3", current_id, "Transfer", amount, "time", receiver_customer_id)
      Passbook.add_entry(passbook_entry)
    else
      puts "sorry you have insufficient balance"
    end
  end

  def self.passbook(current_id)
    all = Passbook.retrieve_entry(current_id)
    puts all
  
  end 

  def log_out
    @@status = nil
  end
end

