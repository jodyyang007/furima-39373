FactoryBot.define do
  factory :item do
    title { "製品名" }
    comment { "説明" }
    price { 2000 }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 13 }
    estimated_shipping_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

