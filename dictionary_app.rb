require "http"

p "Please enter a word you want to look up."
word = gets.chomp

example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

pronunciation_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

top_example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

definition_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

definition = definition_response.parse[0]["text"]

p definition


example = example_response.parse["examples"][0]["text"]

# OR

# definition = example_response.parse
# definitions.each do |definition|
#   puts "#{definition["text"]}"
# end

p example

pronunciations = pronunciation_response.parse

pronunciations.each do |pronunciation|
  p "#{pronunciation["raw"]}"
end

top_example = top_example_response.parse["text"]
p top_example

# examples.each do |example|
#   p example
#   puts ""
# end