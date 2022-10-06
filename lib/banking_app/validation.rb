require 'securerandom'

module Validation
  NAME_REGEX = /[a-zA-Z]/
  EMAIL_REGEX = /^(([A-Za-z0-9]*\.*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i
  PASSWORD_REGEX = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/

  def self.cust_id_generator
    SecureRandom.uuid
  end 

  def self.cust_acc_num
    SecureRandom.hex(10) 
  end

  def self.is_a_valid_name(name)
    if name =~ NAME_REGEX
      return true
    else
      p "Try valid Name"
      return false
    end
  end

  def self.is_a_valid_email(mail)
  if mail =~ EMAIL_REGEX
    return true
  else 
   p "Try valid Mail"
   return false
  end
  end

  def self.is_a_valid_address(address)
   if address.length != 50
    return true
  else 
   p "Address is too long"
   return false
  end
  end

  def self.is_a_valid_password(password)
  if password =~ PASSWORD_REGEX
    return true
  else 
   p "Minimum 8 characters, 1 letter and 1 number needed"
   return false
  end
  end
end
