class DslrShop::CLI

  LIST_PAGE = "https://www.bhphotovideo.com/c/buy/Digital-Cameras/ci/9811/N/4288586282"

  def run
    make_cameras
    add_attributes_from_detail
    list_cameras
    display_menu
    goodbye
  end

  def make_cameras
    camera_collection = DslrShop::Scraper.scrape_from_list(LIST_PAGE)
    DslrShop::Camera.create_from_collection(camera_collection)
  end

  def add_attributes_from_detail
    DslrShop::Camera.all.each {|camera|
      camera_attributes = DslrShop::Scraper.scrape_from_detail(camera.url)
      camera.add_attributes(camera_attributes)
    }
  end

  def list_cameras
    puts "*******************************************************"
    puts "Welcome to the DSLR Shop"
    puts "Your one stop shop for the most popular DSLR cameras"
    puts "*******************************************************"
  end

end
