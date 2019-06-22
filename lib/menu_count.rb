#% cat lib/menu_count.rb

class MenuCount
  def self.start
  
    cli = Cli.new
    cli.see_categories
  end
end
