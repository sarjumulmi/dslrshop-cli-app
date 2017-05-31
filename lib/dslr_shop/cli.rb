class DslrShop::CLI

  LIST_PAGE = "https://www.bhphotovideo.com/c/buy/Digital-Cameras/ci/9811/N/4288586282"

  def run
    make_cameras
    # add_attributes_from_detail
    list_cameras
    display_menu
    goodbye
  end

  def make_cameras
    DslrShop::Scraper.scrape_from_list(LIST_PAGE)
  end

  def add_attributes_from_detail(camera)
    camera.add_attributes
  end

  def list_cameras
    puts "*******************************************************".green
    puts "              Welcome to the DSLR Shop".red
    puts "  Your one stop shop for the most popular DSLR cameras".red
    puts "*******************************************************".green
    puts "        List of the most popular cameras     ".blue
    puts "*******************************************************".green
    DslrShop::Camera.all.each.with_index(1) {|camera, index|
      puts "#{index}. #{camera.brand} #{camera.name} - #{camera.price}"
    }
    puts "*********************************************************************************************".green
  end

  def display_menu
    camera_list = DslrShop::Camera.all
    list_size = camera_list.size
    menu_array = (1..list_size).to_a
    menu_array.concat(["LIST", "list", "EXIT", "exit", "MENU", "menu"])
    menu_array = menu_array.map(&:to_s)
    puts "What would you like to do?".blue
    puts "Please enter 1 ~ #{list_size} to view a specific camera number!!!".blue
    puts "Please enter LIST to view the camera list again!!!".blue
    puts "Please enter EXIT to exit!!!".blue
    puts "Please enter MENU to view the menu again!!!".blue
    puts "*********************************************************************************************".green
    index = gets.strip
    until menu_array.include?(index)
      puts "Invalid Entry!!!!!!".red
      puts "Please Enter the camera number, LIST, EXIT or MENU".red
      puts "*********************************************************************************************".green
      index = gets.strip
    end

    if index.to_i>0
      self.add_attributes_from_detail(camera_list[index.to_i - 1])
      puts "#{camera_list[index.to_i - 1].brand.upcase} #{camera_list[index.to_i - 1].name}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "Rank: #{index}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "Camera Type: #{camera_list[index.to_i - 1].type}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "Includes: #{camera_list[index.to_i - 1].style}".colorize(:color => :light_blue, :background => :light_yellow) if camera_list[index.to_i - 1].style
      puts "Availability: #{camera_list[index.to_i - 1].availability}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "You Pay: #{camera_list[index.to_i - 1].price}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "Discount Received: #{camera_list[index.to_i - 1].discount}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "DslrShop Rewards: #{camera_list[index.to_i - 1].rewards}".colorize(:color => :light_blue, :background => :light_yellow) if camera_list[index.to_i - 1].rewards
      puts "For more information about this camera, visit:".colorize(:color => :light_blue, :background => :light_yellow)
      puts "\t\t#{camera_list[index.to_i - 1].url}".colorize(:color => :light_blue, :background => :light_yellow)
      puts "*********************************************************************************************".green
    elsif index == "LIST" || index == "list"
      self.list_cameras
    elsif index == "EXIT" || index == "exit"
      self.goodbye
    else
      self.display_menu
    end
    self.display_menu
  end

  def goodbye
    puts "               THANK YOU FOR VISITING THE DSLR SHOP!!!!          ".blue
    puts "                      HOPE TO SEE YOU AGAIN!!!!                  ".blue
    puts "                        HAVE A GREAT DAY!!!                      ".blue
    puts "*********************************************************************************************".green
    exit
  end

end
