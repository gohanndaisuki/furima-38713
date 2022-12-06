class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    #@comment = Comment.new
    #@comments = @prototype.comments.includes(:user)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :describe, :category_id, :condition_id, :shipping_fee_status_id, :prefecture_id, :delivery_duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end