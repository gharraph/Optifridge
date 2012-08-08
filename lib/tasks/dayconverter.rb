def page_has_content?(food_page)
  !food_page.parser.css('.bigBlackHeading').text.empty?
end

def create_shelf_life_and_location(food_page)
  food_page.parser.css('.textContainer table table tr').each do |row|
    if !row.css('.slicedHead').text.empty?
      ItemKind.last.shelf_lives.create(:duration => convert_time(row.css('.days').text))
      ItemKind.last.shelf_lives.last.create_location(:name => row.css('.slicedHead').text)
    end
  end
end

def convert_time(duration)
  type = nil
  case
  when /day/ =~ duration
    type = :day
  when /month/ =~ duration
    type = :month
  when /year/ =~ duration
    type = :year
  end
  set_to_days(duration.split, type)
end

def set_to_days(duration, type)
  numeric_time = duration.first.split('-').first.to_i
  case type
  when :day
    numeric_time
  when :month
    numeric_time * 30
  when :year
    numeric_time * 365
  else
    9999
  end
end