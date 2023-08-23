FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'3q' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { '太郎'}
    last_name { '山田' }
    first_name_kana { "カナ" } # 仮の値
    last_name_kana { "カナ" }  # 仮の値
    birthday { Date.new(1990, 1, 1) } # 仮の値
  end
end