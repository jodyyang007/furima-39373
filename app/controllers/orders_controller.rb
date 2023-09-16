class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_shipping = OrderShipping.new
  end

    def create
    binding.pry
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
       @order_shipping.save
       return redirect_to root_path
    else
      render :index
     end
    end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end