class OrderDestination

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Destination.create(item_id: item_id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end