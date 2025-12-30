# 全てがObject
# Class もObject
puts(
  1.class,
  nil.class,
  true.class,
  Class.class
)

# メソッド呼び出しはObjectに対するメッセージ送信
n = 1
n.next

# Class
# UserはClassのインスタンス
# uはUserのインスタンス
class User
  def name
    'Alice'
  end
end

u = User.new

# メソッド呼び出しでは以下の探索が行われる (method lookup)
# 1. uのクラス(User)にnameがあるか？
# 2. UserがincludeしているModule
# 3. 親クラス
# 4. さらに上の親クラス
# 5. Object / Kernel
u.name

# selfはメソッドを実行しているレシーバ
class User
  # self ここのselfはUserクラス自身
  def greet
    self
  end
end

u = User.new
puts u.greet # => u

# public / private
class User
  # public
  def public
    'public'
  end

  private

  def private
    'private'
  end
end

u = User.new
puts(
  u.public
  # u.private   # NoMethodError
)

# protected
# 同じクラスのインスタンス同士なら呼べる
class User
  def initialize(age)
    @age = age
  end

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

alice = User.new(20)
bob = User.new(10)
alice.older_than?(bob)
# alice.age # NoMethodError

# サブクラスでも呼べる
class Admin < User
  def older_than?(user)
    age > user.age
  end
end

a = Admin.new(1)
puts a.older_than?(alice)

# 継承 inheritance
class Admin < User
end

u = Admin.new(10)
# Userに older_than? が定義されてるので呼べる
puts u.older_than?(u)

# include
module Loggable
  def log(msg)
    puts "log: #{msg}"
  end
end

class User
  # Userのメソッド探索チェーンにLoggableが差し込まれる (継承ではない)
  include Loggable
end
