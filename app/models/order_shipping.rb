class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id
  

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, presence: { message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :item_id
    validates :user_id
end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address,building_name: building_name, phone_number:phone_number, order_id: order.id)
  end
end
