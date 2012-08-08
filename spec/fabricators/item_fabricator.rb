Fabricator(:item) do
  user_id { rand(3) + 1 }
  item_kind_id { rand(20) + 1 }
  expiration { DateTime.now }
end

