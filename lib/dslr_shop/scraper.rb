class DslrShop::Scraper

  def self.scrape_from_list(list_url)
    doc = Nokogiri::HTML(open(list_url))
    camera_nodes = doc.search("div.item.clearfix")
    camera_nodes.map {|camera|
      camera = DslrShop::Camera.new
      camera.brand = camera.search("div.desc-zone.zone h3 a span")[0].text
      camera.name =  camera.search("div.desc-zone.zone h3 a span")[1].text.chomp(" (Body Only)")
      camera.availability = camera.search("p.scAvailabilityTri span").text.strip
      camera.price =  camera.search("div.atc-price p span.price").text.strip
      camera.url =  camera.search("div.desc-zone.zone h3 a").attr('href').text
    }
  end

  def self.scrape_from_detail(camera)
    doc = Nokogiri::HTML(open(camera.url))

    camera.discount = doc.search("div.pPrice p span").text.strip
    camera.type = doc.search("div.product-highlights ul li")[0].text
    # begin
    camera.style = doc.search("div.items-group p span")[0].text if doc.search("div.items-group p span")[0]
    # rescue StandardError
    # binding.pry
    # end
    camera.rewards = doc.search("div.acTwoPercent a").text.gsub(/\s+[a-z]*$/, "") if doc.search("div.acTwoPercent a").size>0
    camera
  end

  # This gem provides an interactive CLI to view the top 24 DSLR cameras as rated by the photography store B & H Photography's website.

end
