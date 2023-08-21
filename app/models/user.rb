class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :first_name_kana, presence: true
 validates :last_name_kana, presence: true
 validates :birthday, presence: true

 validate :validate_full_width_name
 
 def validate_full_width_name
  unless full_width?(last_name) && full_width?(first_name)
    errors.add(:last_name, "Last name is invalid. Input full-width characters")
    errors.add(:first_name, "First name is invalid. Input full-width characters")
  end
end


def validate_full_width_name
  unless full_width?(last_name_kana) && full_width?(first_name_kana)
    errors.add(:last_name_kana, "Last name kana is invalid. Input full-width characters")
    errors.add(:first_name_kana, "First name kana is invalid. Input full-width characters")
  end
end


def full_width?(text)
  text =~ /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
end

 validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/,
   message: "is invalid. Include both letters and numbers" }


end
