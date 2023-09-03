require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context '出品できる場合' do
      
      it "titleとimage、category、condition、shipping_fee_burden、prefecture、estimated_shipping、comment、priceが存在すれば出品できる" do
      expect(@item).to be_valid
      end
    end

    context '出品できない場合' do

      it "titleが空では登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank " )
      end

      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "categoryが空では登録できない" do
        @item.category = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end


      it "conditonが空では登録できない" do
        @item.condition = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping fee burdenが空では登録できない" do
        @item.shipping_fee_burden = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it "prefectureが空では登録できない" do
        @item.prefecture = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "estimated shippingが空では登録できない" do
        @item.estimated_shipping = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
      end

      it "commentが空では登録できない" do
        @item.comment =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

