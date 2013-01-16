require 'csv'
require 'rexml/document'

namespace :cc do
  desc "populate all the data for the beginning of the app"
  task :prime => :environment do
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
  end
end
