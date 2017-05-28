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
    puts "        List of the most popular cameras     ".blue
    puts "*******************************************************".green
    DslrShop::Camera.all.each.with_index(1) {|camera, index|
      puts "#{index}. #{camera.brand} #{camera.name} - #{camera.price}"
    }
    puts "*********************************************************************************************".green
  end

  def display_menu
    puts "*******************************************************".green
    puts "              Welcome to the DSLR Shop".red
    puts "  Your one stop shop for the most popular DSLR cameras".red
    puts "*******************************************************".green
    self.list_cameras
    puts "Which camera number are you interested in today?"
    puts "Please enter 1 ~ #{DslrShop::Camera.all.size}."
  end

end
