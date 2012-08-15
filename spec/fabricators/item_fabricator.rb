Fabricator(:item) do
  user_id { rand(3) + 1 }
  item_kind_id { Fabricate(:item_kind) }
  storage { ["pantry", "refridgerator", "freezer"][rand(3)] }
end

