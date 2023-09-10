class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :find_item, only: [:show, :edit, :update]

def index 
  @items = Item.order(created_at: :desc)
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

# def purchase

#   self.sold_out = true
 
# end


  private

  def item_params
    params.require(:item).permit(:image, :title, :comment, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :estimated_shipping_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
   
end