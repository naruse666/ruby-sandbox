# Enumerable はモジュール
# each を実装したクラスに集計・変換・検索等のメソッドを提供する
puts Enumerable.class

# 使える要件
# eachメソッドを実装したクラスでincludeする
class MyList
  include Enumerable

  def initialize(items)
    @items = items
  end

  def each(&block)
    @items.each(&block)
  end
end

# eachが実装されていれば、map, select, any? も使える
# なぜなら、これらはeachを使って実装されているから
list = MyList.new([1, 2, 3, 4, 5])
puts(list.map { |n| n * 2 })

# ブロックがない場合は Enumeratorを返す
# これは遅延評価やチェーンに使われてる
puts list.map

map_enumerator = list.map
puts(map_enumerator.each { |n| n**2 })

puts map_enumerator.next
puts map_enumerator.next

# &ブロック記法
User = Struct.new(:name, :age)
users = [
  User.new(name: 'Alice', age: 20),
  User.new(name: 'Bob', age: 20)
]
puts users.map(&:name)
