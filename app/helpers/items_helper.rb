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
      nil
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
end
