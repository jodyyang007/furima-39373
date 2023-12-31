class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :estimated_shipping

  belongs_to :user
  has_one :order
  has_one_attached :image
  

  validates :title, presence: { message: "can't be blank " }
  validates :image, presence: { message: "can't be blank" }
  validates :comment, presence: { message: "can't be blank" }
  validates :price, presence: true, numericality: {
  only_integer: true,
  greater_than_or_equal_to: 300,
  less_than_or_equal_to: 9_999_999,
  message: "is invalid. Input half-width characters or Price is out of setting range."
}

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_shipping_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  attribute :sold_out, default: false

  def mark_as_sold_out
    update(sold_out: true)
  end


end