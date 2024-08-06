class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params
  before_action :redirect_if_sold_out, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_shipping_info = PurchaseShippingInfo.new
  end

  def create
    @purchase_shipping_info = PurchaseShippingInfo.new(purchase_shipping_info_params)
    if @purchase_shipping_info.valid?
      pay_item
      @purchase_shipping_info.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_shipping_info_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_sold_out
    redirect_to root_path if @item.sold_out?
  end

  def redirect_if_seller
    redirect_to root_path if current_user.id == @item.user_id
  end

  def purchase_shipping_info_params
    params.require(:purchase_shipping_info).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
