class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index,]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    if @item.save
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :shopping_free_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == Item.find(params[:id]).user_id
      redirect_to action: :index
    end
  end
end

