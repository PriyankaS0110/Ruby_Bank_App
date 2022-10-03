module Validetion
  def self.cust_id_genorater
    i = Random.new
    i.rand(3054467878...4254467878) #change this
  end
  def self.cust_acc_num
    n = Random.new
    n.rand(1467878...3467878) #change this
  end
  def self.is_a_valid_name
    @customer_name =~ /[a-zA-Z]+ [a-zA-Z]/
  end
  def self.is_a_valid_email
    @customer_mail =~ /^(([A-Za-z0-9]*\.*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i
  end
  def self.is_a_valid_password
    @customer_password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
  end
end
