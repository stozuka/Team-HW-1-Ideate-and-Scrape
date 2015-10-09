require 'open-uri'
require 'nokogiri'
require 'json'

# Scraper for CodeSchool website
module CodeSchool
  COURSES = 'https://www.codeschool.com/courses'

  # Gets array of courses
  def courses
    Nokogiri::HTML(open(COURSES))
  end

  # Gets names of teacher(s) for one course
  def teacher(name)
    Nokogiri::HTML(open("#{COURSES}/#{name}"))
  end

  # Get an array of course names
  def course_names
    courses.xpath('//h2/a').map(&:text)
  end

  # Change course names to urls
  def course_urls
    # Turn ' ', '.' to '-'
    # Delete ':'
    course_names.map do |name|
      name.downcase.split(' ').join('-').tr('.', '-').delete(':')
    end
  end

  # Get teachar's name by visiting each course page
  def teacher_names
    course_urls.map do |course_url|
      teacher(course_url).xpath('//h3/a').map(&:text)
    end
  end

  # JSON array of course names (string) and teacher(s) (array)
  def code_school_data
    course_names.zip(teacher_names).map do |c_t|
      # { course: c_t[0], teacher: c_t[1] }
      { c_t[0] => c_t[1] }
    end.to_json
  end
end
