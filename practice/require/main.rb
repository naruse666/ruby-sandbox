# frozen_string_literal: true

# 1回だけ読み込む
# $LOAD_PATH を探索
require 'json'

# 2回目は無視される
# require 'json'

# 1回だけ読み込む
# 呼び出し元ファイルを基準に探索
require_relative 'config'

# require / require_relative はここに記録される
puts $LOADED_FEATURES # 読み込んだもの一覧

# 毎回ファイルを読み込む
# $LOAD_PATH も使えるが基本的にパス指定
load 'config.rb'
load 'config.rb' # 再実行される
