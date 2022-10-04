class Passbook
  def self.add_entry(entry)
    $passbook_entry ||= {} 
    $passbook_entry[entry.id] = entry
  end

  def self.retiever_entry(entry_id)
    $passbook_entry[entry_id]
  end
end

class Transaction 
  attr_accessor :transaction_id, :id, :transaction_type, :amount, :time, :receiver_customer_id

  def initialize(transaction_id, id, transaction_type, amount, time, receiver_customer_id)
    @transaction_id = transaction_id
    @id = id
    @transaction_type =  transaction_type
    @amount = amount
    @time = time
    @receiver_customer_id = receiver_customer_id
  end

end
