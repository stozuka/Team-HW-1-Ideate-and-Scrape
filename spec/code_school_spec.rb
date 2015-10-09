require 'minitest/autorun'
require 'minitest/rg'
require_relative '../lib/scrape'
​
describe 'test for code school' do
  before do
    cs = SiteScraper.new
    @codeschool = cs.code_school_data
    @output = File.read('./spec/testfiles/output.json')
  end
  it 'has same length' do
    @codeschool.size.must_equal @output.chomp.length
  end
  it 'should be same' do
    JSON.parse(@codeschool).must_equal JSON.parse(@output)
  end
end