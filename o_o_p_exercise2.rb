class Bank_account

  @@interest_rate = 1.5
  @@accounts = []
  @@total_funds = 0

  def initialize
    @balance = 0

  end

  ##----READERS----
  def balance
    @balance
  end

  ##----WRITERS----
  def balance=(balance)
    @balance = balance
  end

  ##----INSTANCE----

  def deposit(money)
   @balance = (@balance + money)
  end

  def withdraw(taking)
    @balance = (@balance - taking)
  end

  ##-----CLASS-----
  def self.create
     new_bank_acount = Bank_account.new
     @@accounts << new_bank_acount
     return new_bank_acount
   end

   def self.total_funds
      @@accounts.map do |account|
      @@total_funds += account.balance
      end
      return @@total_funds
   end

  def self.interest_time
      @@accounts.map do |account|
        account.change_balance(account.account_balance * @@interest_rate)
      end
    end

end

my_account = Bank_account.create

puts my_account.balance
my_account.deposit(350)
puts my_account.balance
my_account.withdraw(150)
puts my_account.balance

your_account = Bank_account.create

puts my_account.balance
puts Bank_account.total_funds

my_account.deposit(200)
your_account.deposit(1000)

puts my_account.balance.inspect
puts Bank_account.total_funds
# puts your_account.balance
