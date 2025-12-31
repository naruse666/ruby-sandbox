# module
# インスタンスは作れない
# 継承できない
# include / extendされるために存在
module Greeting
  def hello
    'hello'
  end
end

# includeはメソッド探索順に挿入する
# 継承ツリーは書きかわらない
# インスタンスメソッドに入る
class User
  include Greeting
end
puts User.new.hello

# メソッド探索順
# User -> Greeting -> Object

# extend
# クラスメソッドに入る
class User
  extend Greeting
end

puts User.hello # => 'hello'
# puts User.new.hello # => NoMethodError

# moduleは名前空間でもある
# 定数衝突の回避や機能グルーピング
# Railsではディレクトリ構造にもなる
module Admin
  class User
  end
end
# Admin::User

# includeされた時のフック (included)
module Trackable
  # includeされたらクラスメソッドを生やす
  def self.included(base)
    base.extend ClassMethod
  end

  # 生えるクラスメソッド
  module ClassMethod
    def track
      'track'
    end
  end
end

class User
  include Trackable
end
puts User.track

# 継承: is-a
#   User is a ApplicationRecord
# Mixin: can-do
#   User can validate / can track
