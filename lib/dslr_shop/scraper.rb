class DslrShop::Scraper

  def self.scrape_from_list(list_url)
    doc = Nokogiri::HTML(open(list_url))
    camera_nodes = doc.search("div.item.clearfix")
    camera_nodes.map {|camera|
      {
        brand: camera.search("div.desc-zone.zone h3 a span")[0].text,
        name: camera.search("div.desc-zone.zone h3 a span")[1].text.chomp(" (Body Only)"),
        availability: camera.search("p.scAvailabilityTri span").text.strip,
        price: camera.search("div.atc-price p span.price").text.strip,
        url: camera.search("div.desc-zone.zone h3 a").attr('href').text
      }
    }
  end

  def self.scrape_from_detail(detail_url)
    doc = Nokogiri::HTML(open(detail_url))
    camera_attr = {}
    camera_attr[:discount] = doc.search("div.pPrice p span").text.strip
    camera_attr[:type] = doc.search("div.product-highlights ul li")[0].text
    camera_attr[:style] = doc.search("div.items-group p span")[0].text
    camera_attr[:rewards] = doc.search("div.acTwoPercent a").text
    camera_attr
  end

end
