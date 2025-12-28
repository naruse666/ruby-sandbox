# frozen_string_literal: true

# if
def valid?
  true
end
puts 'ok' if valid?
puts 'ng' unless valid?

if valid?
  puts :ok
elsif !valid?
  puts :ng
else
  puts :unknown
end

# case
status = :ok
result = case status
         when :ok
           :ok
         when :ng
           :ng
         end
puts "case result: #{result}"
