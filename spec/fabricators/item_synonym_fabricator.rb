synonyms = ["BANANAS", "Apricot", "APRICOT", "CHIKN", "HUMMUS"]

Fabricator(:item_synonym) do
  name  { synonyms(rand(synonyms.size)) }
  item_kind_id { Fabricate(:item_kind) }
end