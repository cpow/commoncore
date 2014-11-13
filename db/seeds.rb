require 'csv'
require 'rexml/document'

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.where(name: role).first_or_create
  puts 'role: ' << role
end

unless Rails.env.eql?("production")
  puts 'DEFAULT USERS'
  user = User.create!(:name => ENV['ADMIN_NAME'].dup,
    :email => ENV['ADMIN_EMAIL'].dup,
    :password => ENV['ADMIN_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN_PASSWORD'].dup)

  puts 'user: ' << user.name
  user.add_role :admin

  user.posts.create!(title: "this is a seed post", body: "this is some body for the seed post.")
end

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
GradeLevel.create! level: "11-12"

puts "PARSING FOR CORE STANDARDS FOR LITERACY"
JsonParser.new('D10003FC.json').parse_for_standards

puts "PARSING FOR CORE STANDARDS FOR MATH"
JsonParser.new('D10003FB.json').parse_for_standards
