class Scraper

  def self.scrape_categories
    page = Nokogiri::HTML(open("https://www.mcdonalds.com/us/en-us/full-menu.html"))
    categories = []

    page.css(".mcd-category-page__link-item").each do |category|
      categories << {
        :name => category.css(".category-title").text,
        :link => category.css("a").first['href'] }
      end
      categories
  end

  def self.scrape_items(number)
    category = Category.all[number.to_i - 1]
    link = category.link
    
    page = Nokogiri::HTML(open("https://www.mcdonalds.com" + link))
    items = []

    page.css(".categories-item-details").each do |item|
    items << {
      :name => item.css(".categories-item-name").text.strip.blue,
      :calories => item.css(".categories-item-calories").text.strip,
      :category => category}
    end

    sorted_list = items.sort_by {|item_hash| item_hash[:calories]}
    puts "hey hey hey" #sorted_list.values.push("\n")
    end
  
=begin
    #formatted_list = sorted_list.each do |list|
    def self.break_out_hashes(category_array)
    category_array.each do |hash|
    self.new(hash)
  end

  
    formatted_list.each do |object|
      Item.new(object)
    end
    puts Item.all
  end
end
=end