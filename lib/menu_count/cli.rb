require 'colorize'
require './lib/menu_count/scraper.rb'
require './lib/menu_count/category.rb'

module MenuCount
  class CLI

    def see_categories
      puts "Check out the calorie counts at McDonalds!".blue.bold
      puts "
           __
          /
       .-/-.
       |'-'|
       |   |
       |   |   .-----.
       |___/  /' .  '. )   ||/|//
             (`-..:...-')  |`""`  |
              ;-......-;   |    |
         jgs   '------'    |____/
    "
      puts ""
      puts ""
      puts "To see McDonald's menu categories, please enter Y or N.".light_blue
      reply = gets.strip
      puts ""
    
      case(reply)
        when "Y"
          make_categories
          display_categories
          see_items
        when "N"
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        else 
          see_categories
      end
    end

    def make_categories
      category_array = MenuCount::Scraper.scrape_categories
      MenuCount::Category.break_out_hashes(category_array)
    end

    def display_categories
      MenuCount::Category.all.each.with_index(1) do |value, index|
      puts "#{index}. #{value.name}"
    end

    def see_items
      puts ""
      puts "To see the menu items for a category, enter the category number or type exit.".light_blue
      number = gets.strip
      puts ""
    
      case(number)
        when '1'..'13'
          MenuCount::Scraper.scrape_items(number)
        when "exit"
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        else
          see_items
        end
      end
    end

    def see_hamburger
            puts "
                    _....-----------...._
                 .-'  o    o    o    o   '-.
                | o    o    o         o    
               (     o      o   o     o    o  )
             _|   o   o    o      o  o     o  |_
            / `''-----.................-----''`  )
            (___________________________________/
              (~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
           jgs (                             /
                `-._______________________.-'
     
    "
    end

  end
end
