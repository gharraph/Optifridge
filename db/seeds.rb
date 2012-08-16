# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/tasks/dayconverter.rb'
#
agent = Mechanize.new
(16001..19000).each do |id|
  agent.get("http://www.stilltasty.com/fooditems/index/#{id}") do |food_page|
    if page_has_content?(food_page)
      ItemKind.create(:name => food_page.parser.css('.bigBlackHeading').text.strip!)
      create_shelf_life_and_location(food_page)
      puts ItemKind.last.inspect
    end
  end
end

synonym_matches.each { |type| ItemSynonym.create(type) }

# Don't look below.  Just don't.  Pretend this never happened.  Only works in production.
synonym_matches = [ {:name => "ORG DARK CHOC BAR", item_kind_id => 518 },
                    {:name => "COCONUT WATER", item_kind_id => 578 },
                    {:name => "OPEN NATURE SAUS", item_kind_id => 274 },
                    {:name => "OPEN NATURE SAUSAG", item_kind_id => 274 },
                    {:name => "80%LN GR BF", item_kind_id => 170 },
                    {:name => "HOT DOG BUNS", item_kind_id => 107 },
                    {:name => "GLDN EGG HMBGR", item_kind_id => 1036 },
                    {:name => "SDLS WATERMELON", item_kind_id => 2280 },
                    {:name => "ONIONS SWEET", item_kind_id => 2378 },
                    {:name => "TOMATOES ON VINE", item_kind_id => 2143 },
                    {:name => "BEER 30PK", item_kind_id => 174 },
                    {:name => "DSCHT MRIR PL ALE", item_kind_id => 174 },
                    {:name => "R-GREENS KALE", item_kind_id => 1113 },
                    {:name => "HARVEST BREAD", item_kind_id => 534 },
                    {:name => "CRUNCHY ALMOND BUTTER", item_kind_id => 12 },
                    {:name => "SUPER FRUIT POM  CHER", item_kind_id => 1660 },
                    {:name => "A-LEMON EACH", item_kind_id => 1185 },
                    {:name => "64 OZ APPLE", item_kind_id => 45 },
                    {:name => "CREAM TOP ORGANIC MILK", item_kind_id => 1321 },
                    {:name => "JUICE ORGANIC ORANGE", item_kind_id => 1469 },
                    {:name => "VEGGIE & FLAXSEED TORT CHIPS", item_kind_id => 2161 },
                    {:name => "HAMBURGER BUNS HONEY WHT BREAD", item_kind_id => 1036 },
                    {:name => "EGGS 1 DOZ", item_kind_id => 791 },
                    {:name => "MEAT CKN ORG THIGH", item_kind_id => 457 },
                    {:name => "NY STRIP STEAK", item_kind_id => 164 },
                    {:name => "CHUNKY SALSA", item_kind_id => 1873 },
                    {:name => "RED VELVET CUPCAKES", item_kind_id => 713 },
                    {:name => "R-STRAWBERRIES", item_kind_id => 2026 },
                    {:name => "A-PLUM", item_kind_id => 1647 },
                    {:name => "A-PEACH", item_kind_id => 1550 },
                    {:name => "R-SALAD ORGANIC ARUGULA", item_kind_id => 84 },
                    {:name => "A-TOMATOES", item_kind_id => 2143 },
                    {:name => "FRUIT APPLESAUCE POUCHES", item_kind_id => 57 },
                    {:name => "2% MILK HALF GALLO", item_kind_id => 1321 },
                    {:name => "WATER CRACKERS", item_kind_id => 2143 },
                    {:name => "ORANGE JUICE", item_kind_id => 1469 },
                    {:name => "FLOUR TORTILLAS", item_kind_id => 2163 },
                    {:name => "R-STRAWBERRIES", item_kind_id => 2026 },
                    {:name => "BANANAS ORGANIC", item_kind_id => 116 },
                    {:name => "BUTTER QUARTERS", item_kind_id => 309 },
                    {:name => "SHARP CHEDDAR", item_kind_id => 404 },
                    {:name => "SPORT MILK/BISCUIT BAR", item_kind_id => 934 },
                    {:name => "YOG TJ GREEK STYLE POMEGRANATE", item_kind_id => 2330 },
                    {:name => "ENG STILTON W/ APRICOTS", item_kind_id => 2 },
                    {:name => "A-AVOCADOS", item_kind_id => 92 },
                    {:name => "SPANISH MANCHEGO", item_kind_id => 1042 },
                    {:name => "CARROTS CUT & PEELED", item_kind_id => 364 },
                    {:name => "R-BLUEBERRIES", item_kind_id => 239 },
                    {:name => "RBST FREE CREAM CHEESE", item_kind_id => 668 },
                    {:name => "1UCERNE MILK 1%", item_kind_id => 1321 },
                    {:name => "SFWY STRAWBERRIES+", item_kind_id => 2026 },
                    {:name => "BOCA PATTIES CHIKN", item_kind_id => 2479 },
                    {:name => "BANANAS", item_kind_id => 116 },
                    {:name => "GALA APPLES", item_kind_id => 53 },
                    {:name => "NECTARINES", item_kind_id => 1405 },
                    {:name => "ORG BABY CARROT+", item_kind_id => 363 },
                    {:name => "RT HUMMUS", item_kind_id => 1072 }
                  ]