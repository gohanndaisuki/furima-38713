FactoryBot.define do
  factory :order_delivery_address do
    postal_code {"123-4567"}
    prefecture_id { 2 }
    city {"〇〇市"}
    address {"123-4"}
    building_name {"ハイツ〇〇"}
    tel_number { "09012345678" }
  end
end
