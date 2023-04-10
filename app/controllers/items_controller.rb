class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_session, only: [:new]

  def index
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

  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :item_price, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
