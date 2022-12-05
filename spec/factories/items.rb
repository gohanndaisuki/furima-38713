FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    describe {Faker::Lorem.sentence}
    category_id { '2' }
    condition_id { '2' }
    shipping_fee_status_id { '2' }
    prefecture_id { '2' }
    delivery_duration_id { '2' }
    price { '9999' }
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
