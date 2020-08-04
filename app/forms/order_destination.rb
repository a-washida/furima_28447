class OrderDestination

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  def save
    item = Item.find(params[:id])
    user = item.user
    Order.create(user_id: user.id, item_id: item.id)
    Destination.create(item_id: item.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end