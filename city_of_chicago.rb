require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")

city_employees = response.parse

city_employees.each do |city_employee|
  puts "Name: #{city_employee["name"]}"
  puts "Job Title: #{city_employee["job_titles"]}"
  puts "Department: #{city_employee["department"]}"
  puts "Annual Salary: #{city_employee["annual_salary"]}"
end
