Fabricator(:location) do
  shelf_life_id { rand(20) + 1 }
  name { bs(Faker::Lorem) }
end

