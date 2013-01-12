# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'CREATE ALL GRADE LEVELS'
GradeLevel.create! level: "K"
GradeLevel.create! level: "01"
GradeLevel.create! level: "02"
GradeLevel.create! level: "03"
GradeLevel.create! level: "04"
GradeLevel.create! level: "05"
GradeLevel.create! level: "06"
GradeLevel.create! level: "07"
GradeLevel.create! level: "08"
GradeLevel.create! level: "09"
GradeLevel.create! level: "10"
GradeLevel.create! level: "11"
GradeLevel.create! level: "12"
