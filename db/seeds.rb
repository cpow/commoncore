require 'csv'
require 'rexml/document'

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
GradeLevel.create! level: "11-12"

array = []
CSV.foreach("/Users/cpow/Downloads/E0607_ccss_identifiers.csv", :headers => true) do |row| 
  array << Typhoeus.get("#{row.to_hash["URI"]}.xml", followlocation: true) and puts row.to_hash
end

super_array = []
array.each do |typh|
  hash = {}
  hash[:grade] = []
  doc = REXML::Document.new(typh.options[:response_body])
  doc.root.each_element("//LearningStandards/LearningStandardItem/StatementCodes/StatementCode"){|e| hash[:dot_notation] = e.text}
  doc.root.each_element("//LearningStandards/LearningStandardItem/Statements/Statement"){|e| hash[:statement] = e.text}
  doc.root.each_element("//LearningStandards/LearningStandardItem/RefURI"){|e| hash[:uri] = e.text}
  doc.root.each_element("//LearningStandards/LearningStandardItem/LearningStandardDocumentRefId"){|e| hash[:docref_id] = e.text}
  doc.root.each_element("//LearningStandards/LearningStandardItem/RelatedLearningStandardItems/LearningStandardItemRefId"){|e| hash[:related_id] = e.text}
  doc.root.each_element("//LearningStandards/LearningStandardItem/GradeLevels/GradeLevel"){|e| hash[:grade] << e.text unless e.text.empty?}
  REXML::XPath.each(doc, "//*/@RefID"){|e| hash[:guid] = e.to_s}
  hash[:grade].uniq!
  super_array << hash unless hash[:grade].empty?
end

super_array.each do |e|
  level_array = []

  e[:grade].each do |g|
    level_array << GradeLevel.where(level: g).first
  end
  params = {
    dot_notation: e[:dot_notation],
    statement: e[:statemnt],
    uri: e[:uri],
    docref_id: e[:docref_id],
    guid: e[:guid],
    grade_levels: level_array
  }
  CoreStandard.create!(params)
end
