class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_params, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
    render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end
end
