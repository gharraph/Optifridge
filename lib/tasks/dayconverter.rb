def set_to_days(duration)
  type = nil
  case
  when /day/ =~ duration
    type = :day
  when /month/ =~ duration
    type = :month
  when /year/ =~ duration
    type = :year
  end
  convert_time(duration.split, type)
end

def convert_time(duration, type)
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