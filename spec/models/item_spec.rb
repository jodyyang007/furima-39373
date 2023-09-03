require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '出品する' do
    context '出品できる場合' do
      
      it "titleとimage、category、condition、shipping_fee_burden、prefecture、estimated_shipping、comment、priceが存在すれば出品できる" do
      expect(@item).to be_valid
      expect(@item.image).not_to be_nil
      end
    end

    context '出品できない場合' do

      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end


      it "titleが空では保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank " )
      end

      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "categoryが空では保存できない" do
        @item.category = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end


      it "conditonが空では保存できない" do
        @item.condition = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping fee burdenが空では保存できない" do
        @item.shipping_fee_burden = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it "prefectureが空では保存できない" do
        @item.prefecture = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "estimated shippingが空では保存できない" do
        @item.estimated_shipping = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
      end

      it "commentが空では保存できない" do
        @item.comment =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it "priceが空では保存できない" do
        @item.price =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数字以外が含まれている場合は出品できない" do
        @item.price =  'ww22'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters or Price is out of setting range.")
      end
      
      it "priceが300円未満では出品できない" do
        @item.price =  299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters or Price is out of setting range.")
      end
      
      it "priceが9,999,999円を超えると出品できない" do
        @item.price =  110_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters or Price is out of setting range.")
      end

      it 'categoryが「---」を選択した状態では保存できない' do
        @item.category_id = Category.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "conditonが「---」を選択した状態では保存できない" do
        @item.condition_id = Condition.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping fee burdenが「---」を選択した状態では保存できない" do
        @item.shipping_fee_burden_id = ShippingFeeBurden.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it "prefectureが「---」を選択した状態では保存できない" do
        @item.prefecture_id = Prefecture.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "estimated shippingが空では保存できない" do
        @item.estimated_shipping_id = EstimatedShipping.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
      end
    end
  end
end


