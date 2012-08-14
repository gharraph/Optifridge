module ItemsHelper

  def get_storage_badge(location)
    case location
    when "Refrigerator"
      content_tag(:span, "Refrigerator", :class => 'label label-inverse')
    when "Pantry"
      content_tag(:span, "Pantry", :class => 'label')
    when "Freezer"
      content_tag(:span, "Freezer", :class => 'label label-info')
    else
      puts "Something went wrong, bro."
    end
  end

end
