class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel_number, :item_id, :user_id, :token

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1 , message: "can't be blank"} 
  validates :tel_number, presence:true, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid."}
  validates :city, :address, :item_id, :user_id, :token, presence: true 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end
end