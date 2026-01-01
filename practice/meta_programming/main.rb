# Rubyにおけるメタプログラミングとは、
# > 実行時に、クラス・メソッド・振る舞いを定義/変更すること
#
# 前提として、
# - Rubyは実行時にコードを評価する
# - クラス定義は固定ではない

# define_method (動的にメソッドを生やす)
class User
  # メソッド名がシンボル
  # ブロックがメソッド本体となる
  define_method(:greet) do
    'hello'
  end
end

puts User.new.greet

# send / public_send (動的ディスパッチ)
class Admin < User
  private

  def private
    'private'
  end
end
admin = Admin.new

# user.greetを動的に呼んでいるだけ
puts admin.send(:greet)
puts admin.public_send(:greet)

# send: privateも呼べる
# public_send: publicのみ
puts admin.send(:private)

# method_missing
# 定義されていないメソッドが呼ばれた時に発火する
# 強力だが追跡困難
# Railsでは利用が減少している？
class Ghost
  def method_missing(name, *args)
    if name.to_s.start_with?('find_by_')
      'dynamic finder'
    else
      super
    end
  end
end

g = Ghost.new
puts g.find_by_name
puts g.respond_to?(:find_by_name) # => false

# respond_to_missing?
# method_missingとセットで書く
# 実際は呼べるのに respond_to? がfalseを返すという不整合を解決する
class User
  def method_missing(name, *args)
    if name.to_s.start_with?('find_by_')
      'dynamic finder'
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?('find_by_') || super # || superを書かないと親クラスの挙動を壊す
  end
end
u = User.new
puts u.respond_to?(:find_by_name) # => true

# class_eval / instance_eval
# 評価するコンテキストを変更する
#
# class_eval
# Userクラスの文脈で評価
# メソッド定義ができる
User.class_eval do
  def admin?
    false
  end
end
u = User.new
puts u.admin?

# instance_eval
# 特定インスタンスの文脈
# DSL構築に使われたりする
u.instance_eval do
  @secret = 1
end
puts u.inspect

# class_exec, instance_exec は引数を受け取れる点で違う
arg = 1
u.instance_exec(arg) do
  @arg = arg
end

puts u.inspect

# u.instance_eval(arg) do # ArgumentError
#   @eval_arg = 1
# end
