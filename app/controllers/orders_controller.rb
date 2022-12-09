class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  #before_action :set_current_user, only: [:index]

  def index
    @order_delivery_address = OrderDeliveryAddress.new
    unless @item.order.blank?
      redirect_to root_path
    end
    if current_user == @item.user
      redirect_to root_path 
    end
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      pay_item
      @order_delivery_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'             
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end