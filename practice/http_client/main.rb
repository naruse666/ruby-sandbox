require 'net/http'
require 'json'

uri = URI('http://localhost:3000/api/ping')

# simplified
res = Net::HTTP.get_response(uri)

puts(
  res.code,
  res.message,
  res['content-type'],
  res.body,
  JSON.parse(res.body)
)

# with header
req = Net::HTTP::Get.new(uri)
req['Accept'] = 'application/json'

res = Net::HTTP.start(uri.host, uri.port) do |http|
  http.request(req)
end

puts res.code

# faraday
require 'faraday'

conn = Faraday.new('http://localhost:3000') do |f|
  f.request :json
  f.response :json
end

res = conn.get('/api/ping')

puts(
  '=== Faraday ===',
  res.status,
  res.headers,
  res.body
)
