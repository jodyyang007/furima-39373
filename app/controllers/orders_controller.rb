class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create,:show]

  
  def index
    @order = Order.new
    @order_shipping = OrderShipping.new
    if current_user == @item.user || @item.sold_out?
      redirect_to root_path
    end
end

    def create
    @order_shipping = OrderShipping.new(order_params)
    @order = Order.new(item_id: @item.id, user_id: current_user.id)
    pay_item

    if current_user == @item.user || @item.sold_out?
      return redirect_to root_path
    elsif @order_shipping.valid? && @order.save
      @item.mark_as_sold_out
      redirect_to root_path
    else
      render :index
    end
  end
    

    def pay_item
    
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    

    amount = @item.price

    Payjp::Charge.create(
      amount: amount,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
    end


    def show
    if @item.sold_out? || current_user != @item.user
        redirect_to root_path
      elsif current_user != @item.user
        redirect_to new_user_session_path
      end
    end

    
    def find_item
      @item = Item.find(params[:item_id])
    end

    private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number,:card_number, :expiry_form, :card_cvc).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end
end