class OrdersController < ApplicationController
  before_action :move_to_new_user_session, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_if_exhibitor, only: :index
  before_action :move_to_root_if_item_sold, only: :index

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
      redirect_to root_path
    else
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root_if_exhibitor
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id
  end

  def move_to_root_if_item_sold
    redirect_to root_path if @item.order.present?
  end
end
