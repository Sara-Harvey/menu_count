class Item
  attr_accessor :name, :calories, :category
  
  @@all = []

  def initialize(sorted_list)
    hash.each {|k, v| self.send(("#{k}="), v)}  
    @name = name
    @calories = calories
    #@category = category
    
    category.add_item(self)
    @@all << self  
  end

  def self.all
    @@all
  end

end