FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { "カナ" } # 仮の値
    last_name_kana { "カナ" }  # 仮の値
    birthday { Date.new(1990, 1, 1) } # 仮の値
  end
end