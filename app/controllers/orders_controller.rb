class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index]
  
  

  def index
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      order_item
      @order_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])    
  end

  def order_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
  
  def move_to_index
    if current_user.id == @item.user_id || @item.order
        redirect_to root_path
    end
  end
end
