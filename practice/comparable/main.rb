# <=> starship operator (宇宙船演算子) を使うと比較演算子が自動で生える
class Version
  include Comparable

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def <=>(other)
    value <=> other.value
  end
end

v1 = Version.new(1)
v2 = Version.new(2)

puts v1 < v2
puts v1 >= v2
# [v1, v2].sort も使える
