# false, nil 以外は全てtrue

# zero is truthy
puts 'zero' if 0

# ""(empty string) is truthy
puts 'empty string' if ''

# [] (empty array) is truthy
puts 'empty array' if []

# {} (empty hash) is truthy
puts 'empty hash' if {}

# symbol is truthy
puts 'symbol' if :false

# nil is falsy
puts 'nil' if nil
