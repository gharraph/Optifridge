Fabricator(:user) do
  email { Faker::Internet.email }
  password { "password" }
end



Fabricator(:user_with_items, :from => :user) do
  3.times { after_create { |user| Fabricate(:item, :user => user) } }
end

