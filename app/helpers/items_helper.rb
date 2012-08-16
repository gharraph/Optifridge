module ItemsHelper

  def get_storage_badge(location)
    case location
    when "Refrigerator"
      content_tag(:span, "Refrigerator", :class => 'label label-inverse refrigerator')
    when "Pantry"
      content_tag(:span, "Pantry", :class => 'label pantry')
    when "Freezer"
      content_tag(:span, "Freezer", :class => 'label label-info freezer')
    else
      puts "Something went wrong, bro."
    end
  end

  def list_all_storage_options(item_kind)
    @locations = item_kind.shelf_lives.map { |shelf_life| shelf_life.location.name if !shelf_life.location.nil? }.compact
  end

  def insert_storage_options
    if !@item_kind.nil?
      list_all_storage_options(@item_kind)
    else
      ["Refrigerator", "Freezer", "Pantry"]
    end
  end

  def print_name(name)
    if !name.nil?
      if name.length > 50
         name[0,50] + "..."
      else
        name
      end
    end
  end
end
