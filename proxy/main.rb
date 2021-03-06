require 'bank_account'
require 'bank_account_proxy'
require 'virtual_account_proxy'
require 'account_proxy'

account = BankAccount.new 100
account.deposit 50
account.withdraw 10
puts account.balance #=> 140 (100 + 50 - 10)

proxy = BankAccountProxy.new account
proxy.deposit 50
proxy.withdraw 10
puts proxy.balance #=> 180 (140 + 50 - 10)


# 仮装プロキシ
account = VirtualAccountProxy.new { BankAccount.new 10 }

# プロキシをmethod_missing(name, *args)メソッドでリファクタリング
ap = AccountProxy.new BankAccount.new(100)
ap.deposit 50
ap.withdraw 10
puts "account balance is now: #{ap.balance}" #=> 140 (100 + 50 - 10)

