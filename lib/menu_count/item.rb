    
class Item
  attr_accessor :name, :calories, :category
  
  @@all = []

  def initialize(object)
    sorted_list.each {|k, v| self.send(("#{k}="), v)}  
    
    category.add_item(self)
    @@all << self  
  end

  def self.all
    @@all
  end

end