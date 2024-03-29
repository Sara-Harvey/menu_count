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
          more_categories
        when "N"
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        else 
          see_categories
      end
    end

    def make_categories
      category_array = Scraper.scrape_categories
      Category.break_out_hashes(category_array)
    end

    def display_categories
      Category.all.each.with_index(1) do |value, index|
      puts "#{index}. #{value.name}"
    end

    def see_items
      puts ""
      puts "To see the menu items for a category, enter the category number or type exit.".light_blue
      number = gets.strip
      puts ""
    
      case(number)
        when '1'..'13'
          Scraper.scrape_items(number)
        when "exit"
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        else
          see_items
        end
      end
    end
    
    def more_categories
      puts "Would you like to see the categories again? Y or N."
      more = gets.strip
      puts ""
      
      case(more)
        when "Y"
          display_categories
          see_items
          more_categories
        when "N"  
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        when "exit"  
          puts "Thanks for visiting!".blue.bold
          see_hamburger
        else 
          more_categories
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
