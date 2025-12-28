# frozen_string_literal: true

# each
numbers = [1, 2, 3]
numbers.each do |n|
  puts n
end

# map
squared = numbers.map { |n| n**2 }
puts "squared: #{squared}"

# select
puts(numbers.select { |n| n.even? })

# reduce
puts numbers.reduce(0) { |acc, n| acc + n }

# any?
puts(numbers.any? { |n| n.even? })
# all?
puts(numbers.all? { |n| n.even? })
# 以下は同じ意味
# puts(numbers.all?(&:even?))
#   & は to_proc メソッドを呼び出し、ブロックを Proc オブジェクトに変換
# puts(numbers.all?(:even?.to_proc))
