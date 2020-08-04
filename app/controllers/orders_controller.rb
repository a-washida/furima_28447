class OrdersController < ApplicationController
  before_action :move_to_new_user_session, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderDestination.new
  end

  def create
    order_params_delete_token = order_params
    order_params_delete_token.delete(:token)
    @order = OrderDestination.new(order_params_delete_token)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @order = OrderDestination.new
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

end
