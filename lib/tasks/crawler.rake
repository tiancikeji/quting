require 'rubygems'
require 'nokogiri'
require 'httparty'
require 'open-uri'


namespace :medium do
  desc "crawl medium mp3 file  "
  task :crawl do
    Rake::Task[:environment].invoke

    BASE_URL = "http://www.huaxiazi.com"
    INDEX_URL = "#{BASE_URL}"
    PAGE_URL = "http://huaxiazi.com/ajax/GetBook.aspx"
    Productinfo_URL = "#{BASE_URL}/productinfo.aspx?id="
    total_page = 488
    total_page.times do |page|
      p page
      @result = HTTParty.post(PAGE_URL, 
                              :body => { :page => page, 
                                         :ClassId => '1', 
                                         :Orderid => '1', 
                                         :Series => '0', 
                                         :Price => '2'
      })
      doc = Nokogiri.HTML(@result.response.body.force_encoding('UTF-8'))

      urls = []
      image_urls = []
      names = []
      authors = []
      yanbos = []
      jishus = []
      times = []
      categories = []
      updatetimes = []
      descriptions = []

      doc.css('div').css('a.sk_bk_img').each do |a|
        urls << a['href'].to_s
        image_urls << a.children[1]['src']
      end

      doc.css('div').css('div.sk_bk_info').each do |div|
        categories << div.children[0].children[0].children[0].children.text
        names << div.children[0].children[0].children[1].children.text
        descriptions << div.children[1].text
        authors << div.children[2].children[0].children[1].text
        yanbos <<  div.children[2].children[0].children[3].children[1]['title']
        jishus << div.children[2].children[0].children[4].text
        updatetimes << div.children[2].children[1].children[0].text
      end

      # save media
      urls.each_with_index do |url,index|
        media = Medium.new
        media.url = BASE_URL+"/"+url
        media.mtype = BASE_URL+image_urls[index]
        media.name = names[index]
        media.author = authors[index]
        media.yanbo = yanbos[index]
        media.jishu = jishus[index]
        # media.time = times[index]
        media.category = categories[index]
        media.updatetime = updatetimes[index]
        media.description = descriptions[index]
        media.save
        p media.url
        productinfo_page = Nokogiri::XML(open(media.url))
        productinfo_page.css("div.xq_list").children[1].children.each_with_index do | m,ind |
          if  m.children.count == 6 and ind > 1
            id =  m.children[0].children[0]['href'].to_s
            id =  id.split("=")[1].split("&")[0]

            xml = Nokogiri::XML(open("http://huaxiazi.com/ajax/GetPlayInfo.aspx?PAID="+id))
              xml.xpath("//root/NowPlay").map do |i|
              #save files
              mfile = Mfile.new
              mfile.medium_id = media.id
              mfile.name = i.xpath("Title").children.text
              mfile.time = i.xpath("Length").children.text
              mfile.url = i.xpath("Url").children.text
              mfile.save

              Dir.mkdir("public/mp3/"+mfile.id.to_s,0755)
              savepath = "public/mp3/"+mfile.id.to_s+"/"+mfile.name+".mp3"
              File.open(savepath, "wb") do |saved_file|
              open(URI::encode(mfile.url), 'rb') do |read_file|
                  saved_file.write(read_file.read)
                 end
              end
              mfile = Mfile.update(mfile.id,:url => savepath)

              p mfile
            end

          end
        end
      end


    end
  end
end
