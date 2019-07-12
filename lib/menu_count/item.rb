    
class Item
  attr_accessor :name, :calories, :category
  
  @@all = []

  def initialize(item_hash)
    item_hash.each {|k, v| self.send(("#{k}="), v)}  
    
    category.add_item(self)
    @@all << self  
  end

  def self.all
    @@all
  end

end