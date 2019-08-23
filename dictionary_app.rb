require "http"

p "Please enter a word you want to look up."
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

definition = response.parse[0]["text"]

p definition

example_response = HTTP.get("https://api.wordnik.com/v4/word.json/hello/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

example = response.parse[0][]
# examples.each do |example|
#   p example
#   puts ""
# end