class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderDestination.new
  end

  def create
    @order = OrderDestination.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
