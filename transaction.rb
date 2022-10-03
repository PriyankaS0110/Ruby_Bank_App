class Passbook
  def self.add_entry(entry)
    $passbook_entry ||= {} 
    $passbook_entry[entry.customer_id] = entry
  end

  def self.retiever_entry(entry_id)
    $passbook_entry[entry_id]
  end
end

class Transaction 
  attr_accessor :transaction_id, :customer_id, :transaction_type, :amount, :time, :receiver_cust_id

  def initialize(transaction_id, customer_id, transaction_type, amount, time, receiver_cust_id)
    @transaction_id = transaction_id
    @customer_id = customer_id
    @transaction_type =  transaction_type
    @amount = amount
    @time = time
    @receiver_cust_id = receiver_cust_id
  end

end
