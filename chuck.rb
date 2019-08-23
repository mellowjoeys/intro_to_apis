require "http"

response = HTTP.get("https://api.chucknorris.io/jokes/random")

system "clear"
puts "Do you want to hear a joke?"
user_input = gets.chomp

puts ""
puts response.parse["value"]