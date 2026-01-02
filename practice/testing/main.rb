# Rubyは動的型付け、実行時エラーが多い、メタプログラミングを多用するため
# テストで担保する文化が発達している
#
# Railsでは privateメソッドは直接テストしないで、public API の挙動を保証するという思想がある

# Minitest
# - Ruby標準
# - xUnit系
# - シンプル・高速
# `assert_equal 2, add(1, 1)`
#
# RSpec
# - DSL指向
# - 振る舞い記述(BDD)
# - Railsで主流
# `expect(add(1, 1)).to eq 2`

# Stub / Mock
# Railsで見る典型例
# `allow(api).to receive(:call).and_return(result)`

# Railsで典型的な対応関係
# model spec - モデルの責務
# request spec - HTTP境界
# service spec - ビジネスロジック
# job spec - 非同期処理
