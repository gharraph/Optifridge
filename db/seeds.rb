# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require_relative '../lib/tasks/dayconverter.rb'
# # 
# agent = Mechanize.new
# (16001..19600).each do |id|
#   agent.get("http://www.stilltasty.com/fooditems/index/#{id}") do |food_page|
#     if page_has_content?(food_page)
#       ItemKind.create(:name => food_page.parser.css('.bigBlackHeading').text.strip!)
#       create_shelf_life_and_location(food_page)
#       puts ItemKind.last.inspect
#     end
#   end
# end

# Don't look below.  Just don't.  Pretend this never happened.  Only works in production.
synonym_matches = [ {:name => "ORG DARK CHOC BAR", :item_kind_id => 518 },
                    {:name => "COCONUT WATER", :item_kind_id => 578 },
                    {:name => "OPEN NATURE SAUS", :item_kind_id => 274 },
                    {:name => "OPEN NATURE SAUSAG", :item_kind_id => 274 },
                    {:name => "80%LN GR BF", :item_kind_id => 170 },
                    {:name => "HOT DOG BUNS", :item_kind_id => 107 },
                    {:name => "BEER 30PK", :item_kind_id => 174 },
                    {:name => "DSCHT MRIR PL ALE", :item_kind_id => 174 },
                    {:name => "HARVEST BREAD", :item_kind_id => 534 },
                    {:name => "CRUNCHY ALMOND BUTTER", :item_kind_id => 12 },
                    {:name => "64 OZ APPLE", :item_kind_id => 45 },
                    {:name => "MEAT CKN ORG THIGH", :item_kind_id => 457 },
                    {:name => "NY STRIP STEAK", :item_kind_id => 164 },
                    {:name => "CHUNKY SALSA", :item_kind_id => 1873 },
                    {:name => "R-SALAD ORGANIC ARUGULA", :item_kind_id => 84 },
                    {:name => "FRUIT APPLESAUCE POUCHES", :item_kind_id => 57 },
                    {:name => "BANANAS ORGANIC", :item_kind_id => 116 },
                    {:name => "BUTTER QUARTERS", :item_kind_id => 309 },
                    {:name => "SHARP CHEDDAR", :item_kind_id => 404 },
                    {:name => "ENG STILTON W/ APRICOTS", :item_kind_id => 2 },
                    {:name => "A-AVOCADOS", :item_kind_id => 92 },
                    {:name => "CARROTS CUT & PEELED", :item_kind_id => 364 },
                    {:name => "R-BLUEBERRIES", :item_kind_id => 239 },
                    {:name => "BANANAS", :item_kind_id => 116 },
                    {:name => "GALA APPLES", :item_kind_id => 53 },
                    {:name => "ORG BABY CARROT+", :item_kind_id => 363 },
                  ]
                  
synonym_matches.each { |type| ItemSynonym.create(type) }
