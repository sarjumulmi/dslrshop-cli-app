class DslrShop::Camera

  attr_accessor :brand, :name, :url, :availability, :price, :discount, :style,:type, :rewards
  @@all = []

  def self.all
    @@all
  end

  def initialize(brand = nil, name = nil, availability = nil, price = nil, url = nil)
    @brand = brand
    @name = name
    @availability = availability
    @price = price
    @url = url
    @@all << self
  end

  # def self.create_from_collection(camera_collection)
  #   # camera_collection=> array of camera_hashes
  #   camera_collection.each {|camera_hash|
  #     self.new(camera_hash)
  #   }
  # end

  def add_attributes
    DslrShop::Scraper.scrape_from_detail(self)
  end

end
