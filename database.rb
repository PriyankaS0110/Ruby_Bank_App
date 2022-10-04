require 'singleton'

class Database
  include Singleton

  attr_accessor :accounts, :transactions, :current_user

  def initialize
    @accounts = []    
    @transactions = []
    @current_user = nil    
  end
end

database = Database.instance
db = Database.instance

database.current_user = 'Ram'
db.current_user = 'Sita'

p database.current_user
p db.current_user
