class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :shopping_free_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end
end
