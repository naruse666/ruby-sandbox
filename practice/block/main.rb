# blockとはメソッドに渡される無名の処理の塊
#
# 構文ではなく、メソッド呼び出しに付随するもの
# users.each do |user|
#   puts user.name
# end
# each: メソッド
# do ... end: ブロック
# |user|: ブロック引数

# メソッド側では、yieldでブロックを呼び出す
def greet
  yield 'Alice' if block_given?
end

# 1. greetが呼ばれる
# 2. yield 'Alice'が呼ばれる
# 3. ブロックに制御が戻る
greet do |name|
  puts "Hello #{name}"
end

# &blockと書くと、 Procとして受け取れる
# &は to_proc を呼ぶ
def g(&block)
  # block.call
end

# Proc
# 引数チェックがゆるい
# returnは定義元のメソッドから戻る
p = proc { |x| x * 2 }
puts p.call(1)
puts p.call(1, 2)

# proc_testメソッド自体を抜ける
def proc_test
  p = proc { return 'from proc' }
  p.call
  'after'
end
puts proc_test # => from proc

# Lambda
# 引数チェックが厳密
# return はlambda内だけ
l = ->(x) { x * 2 }
puts l.call(1)
# puts l.call(1, 2) # ArgumentError

def lambda_test
  l = -> { 'from lambda' }
  l.call
  'after'
end
puts lambda_test # => after

# &:記法
# users.map(&:name) は以下と等価
# users.map { |u| u.name }
#
# 1. :name -> Symbol
# 2. & -> to_proc
# 3. u.send(:name)
