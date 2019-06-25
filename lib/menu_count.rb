
class MenuCount
  
  def self.start
    cli = CLI.new
    cli.see_categories
  end

end

require './lib/menu_count/cli.rb'