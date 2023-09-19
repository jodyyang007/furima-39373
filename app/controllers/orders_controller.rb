class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_shipping = OrderShipping.new

  if current_user != @item.user || @item.sold_out?
    redirect_to root_path
  end
end



    def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    @order = Order.new(item_id: @item.id, user_id: current_user.id)
    pay_item

    if current_user == @item.user
      return redirect_to root_path
    elsif @order_shipping.valid? && @order.save
      @item.mark_as_sold_out
      redirect_to root_path
    else
      render :index
    end
  end
    

    def pay_item
    Payjp.api_key = "sk_test_5fe4735ea4c3dd01b6331e40" 

    amount = @item.price

    Payjp::Charge.create(
      amount: amount,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
    end


    def show
      @item = Item.find(params[:id])

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