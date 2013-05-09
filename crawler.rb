require 'rubygems'
require 'nokogiri'
require 'open-uri'

BASE_URL = "http://www.huaxiazi.com"
LIST_URL = "#{BASE_URL}"

doc = Nokogiri::HTML(open(LIST_URL))
i = 0
doc.xpath('//a[@href]').each do |link|
  href = link['href']
  if href.match("Productinfo")
    p href
    i = i+1
  end
end
p i
