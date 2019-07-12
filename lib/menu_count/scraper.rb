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
        
    list = items.sort_by {|item_hash| item_hash[:calories]}

    output = list.each do |sorted_list|
      Item.new(sorted_list)
      end
    output.values.push("\n")
  end

end