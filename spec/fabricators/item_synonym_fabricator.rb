Fabricator(:item_synonym) do
  name  { "veggies" }
  item_kind_id { Fabricate(:item_kind) }
end