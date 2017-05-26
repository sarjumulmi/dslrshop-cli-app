class DslrShop::Camera

  attr_accessor :name, :type, :availability, :price, :discount, :style, :reward, :url
  @@all = []

  def self.all
    @@all
  end

  def initialize(camera_hash)
    camera_hash.each {|key, value|
      self.send(("#{key}="),value)
    }
    @@ll << self
  end

  def self.create_from_collection(camera_collection)
    # camera_collection=> array of camera_hashes
    camera_collection.each {|camera_hash|
      Camera.new(camera_hash)
    }
  end
  
end
