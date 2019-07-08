class Category
  attr_accessor :name, :link
  
  @@all = []

  def initialize(hash)
    hash.each {|k, v| self.send(("#{k}="), v)}  
    @link = link
    @name = name

    @@all << self  
  end

  def self.all
    @@all
  end

  def self.break_out_hashes(category_array)
    category_array.each do |hash|
    self.new(hash)
  end
  end

end
