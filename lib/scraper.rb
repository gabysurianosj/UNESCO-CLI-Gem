require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sanitize'

require_relative './site.rb'

class Scraper

  def self.get_page
    Nokogiri::XML(open("http://whc.unesco.org/en/list/rss/"))
  end

  def self.make_sites
    self.get_page.xpath('//item').each do |item|
      site = Site.new
      site.title = item.xpath('title').text
      site.description = Sanitize.clean(item.css('description').text).strip
    end
  end

end
