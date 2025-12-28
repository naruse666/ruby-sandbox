# frozen_string_literal: true

# local variable
a = 1

# constant
HELLO = 'Hello'

x = if a > 0
      10
    else
      20
    end

puts HELLO + x.to_s

# 全てがObject. primitive typeは存在しない
puts(
  1.class,
  'abc'.class,
  true.class,
  nil.class,
  String.class,
  [].class,
  {}.class
)

# 数値にもメソッドがある
puts(
  1.next,
  2.even?
)

# Array and Hash
arr = [1, 2, 3]
puts arr[0]
puts(arr.map { |n| n * 2 })

hash = { name: 'Alice', age: 20 }
# symbol is better to use as key, it's immutable and more memory-efficient
puts hash[:name]
