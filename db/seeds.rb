# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/tasks/dayconverter.rb'

agent = Mechanize.new
# 16000-17000... about 3.5m
# 17000-18000... about 4m
# 18001-19000... about 4m
(18001..19000).each do |id|
  if id * rand(2)
    agent.get("http://www.stilltasty.com/fooditems/index/#{id}") do |food_page|
      if page_has_content?(food_page)
        ItemKind.create(:name => food_page.parser.css('.bigBlackHeading').text.strip!)
        create_shelf_life_and_location(food_page)
        puts ItemKind.last
      end
    end
  end
end