class JsonParser
  attr_accessor :standards

  def initialize(path)
    @standards = JSON.parse(File.read(path))
  end

  def parse_for_standards
    @standards.keys.map do |key|
      core_standard = CoreStandard.new
      set_statement_for(core_standard, key)
      add_grade_levels_for(core_standard, key)
      add_dot_notation_for(core_standard, key)
      if @standards[key.to_s][subject].present?
        @standards[key.to_s][subject].first["value"]
      end
      core_standard.save!
    end
  end

  private

  def add_dot_notation_for(core_standard, key)
    if @standards[key.to_s][notation].present?
      core_standard.dot_notation = @standards[key.to_s][notation].first["value"]
    end
  end

  def set_statement_for(core_standard, key)
    if @standards[key.to_s][description].present?
      core_standard.statement = @standards[key.to_s][description].first["value"]
    end
  end

  def add_grade_levels_for(core_standard, key)
    if @standards[key.to_s][education_level].present?
      @standards[key.to_s][education_level].map do |single_level|
        level = single_level["value"].split('/').last
        if level.to_i > 0
          level_value = level.rjust(2, '0')
        else
          level_value = level
        end
        grade_level = GradeLevel.find_by_level(level_value)
        core_standard.grade_levels << grade_level
      end
    end
  end

  def description
    "http://purl.org/dc/terms/description"
  end

  def education_level
    "http://purl.org/dc/terms/educationLevel"
  end

  def notation
    "http://purl.org/ASN/schema/core/statementNotation"
  end

  def subject
    "http://purl.org/dc/terms/subject"
  end
end
