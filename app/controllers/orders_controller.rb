class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params
  before_action :redirect_if_sold_out, only: [:index, :create]

  # def index
  #   @purchase_shipping_info = PurchaseShippingInfo.new
  # end

  # def create
  #   @purchase_shipping_info = PurchaseShippingInfo.new(purchase_shipping_info_params)
  #   if @purchase_shipping_info.valid?
  #     @purchase_shipping_info.save
  #     redirect_to root_path
  #   else
  #     render :index, status: :unprocessable_entity
  #   end
  # end

  # private

  # def set_params
  #   @item = Item.find(params[:item_id])
  # end

  def redirect_if_sold_out
    redirect_to root_path if @item.sold_out?
  end

  # def purchase_shipping_info_params
  #   params.require(:purchase_shipping_info).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
  #     user_id: current_user.id, item_id: params[:item_id]
  #   )
  # end
end
