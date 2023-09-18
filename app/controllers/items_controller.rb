class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

def index 
  @items = Item.order(created_at: :desc)
end 
  
def edit
  if current_user != @item.user
    redirect_to root_path
  end
end


def new
 @item = Item.new
end
  
def create
 @item = Item.new(item_params)
 @item.user = current_user 
if 
  @item.save
  redirect_to root_path
else
  render :new
end
end



 def update
   if  @item.update(item_params)
    redirect_to item_path(@item)
  else
    render 'edit'
  end
end


def destroy
  if current_user == @item.user
  if @item.destroy
     redirect_to root_path
  else
    redirect_to item_path(@item)
  end
end
end



def purchase
  if perform_purchase
  if @item.update(sold_out: true)
    redirect_to root_path
  end
end
end

  private

  def item_params
    params.require(:item).permit(:image, :title, :comment, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :estimated_shipping_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
  

end