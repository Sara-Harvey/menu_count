class Item
  attr_accessor :name, :calories, :category
  
  @@all = []

  def initialize(hash)
    hash.each {|k, v| self.send(("#{k}="), v)}  
    #@name = name
    #@calories = calories
    
    #category.add_item(self)
    @@all << self  
  end

  def self.all
    @@all
  end

end