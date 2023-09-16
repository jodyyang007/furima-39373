class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :street_address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
end

  def save
    order = Order.create(item: item, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, street_address: street_address, building_name: building_name, phone_number:phone_number, order_id: order.id)
  end
end
