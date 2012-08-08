# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/tasks/dayconverter.rb'



#for years http://www.stilltasty.com/fooditems/index/16518

(16400..16450).each do |id|
  agent = Mechanize.new
  agent.get("http://www.stilltasty.com/fooditems/index/#{id}") do |food_page|
    unless food_page.parser.css('.bigBlackHeading').text.empty?
      ItemKind.create(:name => food_page.parser.css('.bigBlackHeading').text.strip!)
      puts ItemKind.last
      food_page.parser.css('.textContainer table table tr').each do |row|
          if !row.css('.slicedHead').text.empty?
            ItemKind.last.shelf_lives.create(:duration => set_to_days(row.css('.days').text))

            ItemKind.last.shelf_lives.last.create_location(:name => row.css('.slicedHead').text)
          end
      end
    else
      puts "Caught an empty page"
    end
  end
end