class DslrShop::Scraper

  def self.scrape_from_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
    camera_nodes = doc.search("div.item.clearfix")
    camera_nodes.map {|camera|
      {
        brand: camera.search("div.desc-zone.zone h3 a span")[0].text,
        name: camera.search("div.desc-zone.zone h3 a span")[1].text

      }
      
    }

  end
end
