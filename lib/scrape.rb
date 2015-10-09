require_relative './code_school'

# Scraper class for several sites
class SiteScraper
  include CodeSchool

  def code_school_output
    puts code_school_data
  end
end
