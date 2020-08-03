class ItemsController < ApplicationController
  before_action :set_item, only: :show
  before_action :move_to_new_user_session, except: [:index, :show]

  def index
    @items = Item.includes(:user)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
