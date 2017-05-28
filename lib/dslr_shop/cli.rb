class DslrShop::CLI

  LIST_PAGE = "https://www.bhphotovideo.com/c/buy/Digital-Cameras/ci/9811/N/4288586282"

  def run
    make_cameras
    add_camera_attributes
    list_cameras
    display_menu
    goodbye
  end

  def make_cameras
    camera_collection = DslrShop::Scraper.scrape_from_list(LIST_PAGE)
    cameras = DslrShop::Camera.create_from_collection(camera_collection)
  end

  def list_cameras
    puts "*******************************************************"
    puts "Welcome to the DSLR Shop"
    puts "Your one stop shop for the most popular DSLR cameras"
    puts "*******************************************************"
  end

end
