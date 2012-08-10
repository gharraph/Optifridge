Fabricator(:shelf_life) do
  item_kind_id { rand(20) + 1 }
  duration { rand(365) + 1}
end
