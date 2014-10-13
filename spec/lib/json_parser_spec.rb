require 'spec_helper'

describe JsonParser do
  describe "#parse_for_standards" do
    it 'should create a new core standard' do
      parser = described_class.new("spec/fixtures/files/standard_json_partial.json")
      stub_grade_levels
      parser.parse_for_standards

      expect(CoreStandard.count).to eq 1
    end

    it 'should add the correct grade levels to the core standard' do
      parser = described_class.new("spec/fixtures/files/standard_json_partial.json")
      stub_grade_levels
      parser.parse_for_standards

      standard = CoreStandard.first
      expect(standard.levels.count).to eq 2
    end
  end

  def stub_grade_levels
    kindergarden = build_stubbed :grade_level, level: "K"
    grade12 = build_stubbed :grade_level, level: '12'
    GradeLevel.stub(:find_by_level).with("K").and_return(kindergarden)
    GradeLevel.stub(:find_by_level).with("12").and_return(grade12)
  end
end
