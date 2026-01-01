# `ruby app.rb` では以下が起きている
# 1. Ruby VM起動
# 2. エントリファイルを上から評価
# 3. require等で他ファイルを読み込み
# 4. 定数・クラス・メソッドが定義されていく
#
# つまり、宣言と実行フェーズが分離されてないので、実行順が意味を持つ

# Gemとは
# - Rubyコードの集合
# - メタデータ(gemspec)
# - バージョン付き
#
# `gem list`でみれる
#
# Gemの中のrubyファイルが requireされているだけで、Railsも巨大なGemにすぎない

# Bundlerの役割
# 依存関係の宣言やバージョン制約の定義をする
# ```Gemfile
#   gem 'rails', '~> 7.1'
#   gem 'pg'
# ```
#
# `bundle install`で依存を解決し、Gemfile.lockを生成
#
# `bundle exec` で、このアプリ用に解決されたGem環境でコマンドを実行するという意味
