# Rubyのエラーは Exception Object
# Exception
# └─ StandardError
#     ├─ RuntimeError
#     ├─ ArgumentError
#     ├─ NoMethodError
#     ├─ NameError
#     └─ TypeError
#
# rescueはデフォルトで StandardError以下のみを補足する
# Exceptionを丸ごとrescueするのはアンチパターン

# raise 'error' これは内部的に
# raise RuntimeError.new('error')

# begin / rescue / ensure
begin
  # risky...
rescue ArgumentError => e
  # handle
rescue StandardError
  # fallback...
ensure
  # cleanup
  puts 'ensure'
end

# rescue 修飾子
# riskyが例外を投げたらnil (StandardErrorのみ)
# value = risky rescue nil
#
# ガード節に使われるが、多用するとバグを隠す

# retry
count ||= 0
begin
  count += 1
  # risky
rescue StandardError
  # beginに戻る
  retry if count < 3
end

# 例外の伝播
# 途中でrescueされない限り上に伝播する
# c -> b -> a
def a
  b
end

def b
  c
end

def c
  rails 'boom'
end
