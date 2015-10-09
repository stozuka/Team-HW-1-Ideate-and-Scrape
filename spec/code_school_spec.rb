require "minitest/autorun"
require "minitest/rg"
require "./lib/code_school.rb"


describe "test for code school" do
  before do
    cs = CodeSchool.new
    @codeschool = cs.get_json
    @output = JSON.load_file("testfiles/output.txt")
  end
  it "has same length" do
    @codeschool.size.must_equal @output.size
  end
  it "should be same" do
    @codeschool.must_equal @output
  end
end
