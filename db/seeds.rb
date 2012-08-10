# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative '../lib/tasks/dayconverter.rb'

agent = Mechanize.new
(16401..16404).each do |id|
  agent.get("http://www.stilltasty.com/fooditems/index/#{id}") do |food_page|
    if page_has_content?(food_page)
      ItemKind.create(:name => food_page.parser.css('.bigBlackHeading').text.strip!)
      create_shelf_life_and_location(food_page)
    end
  end
end