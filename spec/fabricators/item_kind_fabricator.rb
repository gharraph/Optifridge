Fabricator(:item_kind) do
  name { ["APRICOTS FRESH, RAW, CUT UP", "APRICOTS FRESH, RAW, WHOLE", "APRICOTS, CANDIED UNOPENED OR OPENED PACKAGE"][rand(3)]       }
  2.times { after_create { |item_kind| Fabricate(:shelf_life, :item_kind => item_kind) } }
end
