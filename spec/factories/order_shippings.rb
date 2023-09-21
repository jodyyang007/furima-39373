FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567' }
    prefecture_id { 13 }
    city { 'Shinjuku' }
    street_address { '123' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end