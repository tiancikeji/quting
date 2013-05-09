require 'rubygems'
require 'nokogiri'
require 'httparty'
require 'open-uri'

BASE_URL = "http://www.huaxiazi.com"
INDEX_URL = "#{BASE_URL}"
Productinfo_URL = "#{BASE_URL}/productinfo.aspx?id="

# n = 10
# while n > 0 do
  doc = Nokogiri::HTML(open(Productinfo_URL+"42863"))
  doc.xpath('//a[@href]').each do |link|
    href = link['href']
    if href.match("Play.aspx")
      id = href.split("id=")[1].split("&")[0]
      xml = Nokogiri::XML(open("http://huaxiazi.com/ajax/GetPlayInfo.aspx?PAID="+id))
      # p xml 
      xml.xpath("//root/NowPlay").map do |i|
        p i.xpath("Title").children.text
        p i.xpath("Length").children.text
        p i.xpath("Url").children.text
      end
    end
  end
  
  # n=n-1
# end

