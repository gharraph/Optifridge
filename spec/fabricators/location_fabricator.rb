Fabricator(:location) do
  shelf_life_id { rand(20) + 1 }
  name { ["pantry", "refrigerator", "freezer"][rand(3)] }
end

