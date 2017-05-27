class DslrShop::Camera

  attr_accessor :brand, :name, :url, :availability, :price, :discount, :type, :style, :rewards
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

  def self.add_attributes(attribute_hash)
    attribute_hash.each {|key, value|
      self.send(("#{key}="), value)
    }
    self
  end

end
