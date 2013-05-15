require 'rubygems'
require 'nokogiri'
require 'httparty'
require 'open-uri'
require 'iconv'


namespace :medium do
  desc "crawl medium mp3 file  "
  task :crawl do
    Rake::Task[:environment].invoke

    BASE_URL = "http://www.huaxiazi.com"
    INDEX_URL = "#{BASE_URL}"
    Productinfo_URL = "#{BASE_URL}/productinfo.aspx?id="
    p BASE_URL
    # n = 10
    # while n > 0 do
      url = Productinfo_URL+"42863"
      doc = Nokogiri::HTML(open(url))
      # save media
      media = Medium.new
      media.url = url
      media.mtype = BASE_URL + doc.xpath('//span[@class="bk_img left"]//img/@src').to_s
      media.name = doc.xpath('//span[@class="bk_tit"]').children.text
      media.author = ""
      media.yanbo = ""
      media.jishu = ""
      media.time = ""
      media.category = ""
      media.updatetime = "o"
      media.description = doc.xpath('//p[@id="hutia"]').children.text
      p media
      media.save
      doc.xpath('//a[@href]').each do |link|
        href = link['href']
        if href.match("Play.aspx")
          id = href.split("id=")[1].split("&")[0]
          xml = Nokogiri::XML(open("http://huaxiazi.com/ajax/GetPlayInfo.aspx?PAID="+id))
          xml.xpath("//root/NowPlay").map do |i|
          # save files
            mfile = Mfile.new
            mfile.medium_id = media.id
            mfile.name = i.xpath("Title").children.text
            mfile.time = i.xpath("Length").children.text
            mfile.url = i.xpath("Url").children.text
            # p mfile
            mfile.save
          end
        end
      end
      # n=n-1
    # end

  end
end
