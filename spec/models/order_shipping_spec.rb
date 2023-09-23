require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '住所保存できる' do

    context '住所保存できる場合' do
      it "postal_codeとprefecture、city、street_address、phone_number、tokenが存在すれば保存できる" do
        expect(@order_shipping).to be_valid
      end

      it "建物名が空でも保存できる" do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '住所保存できない場合' do

      it "postal_codeが空では保存できない" do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code が正しい形式でない場合は保存できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_id が空では保存できないこと' do
        @order_shipping.prefecture_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では保存できない" do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it "street_addressが空では保存できない" do
        @order_shipping.street_address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Street address can't be blank")
      end

      it "phone_numberが空では保存できない" do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number が正しい形式でない場合は保存できないこと' do
        @order_shipping.phone_number = '090-12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end


      it '9桁以下の電話番号で保存できない' do
        @order_shipping.phone_number = '090'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end

      it '12桁以上の電話番号で保存できない' do
        @order_shipping.phone_number = '1234567890987'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end


      it 'item_id が空では保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_id が空で は保存できないこと'do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では保存できないこと" do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it "prefectureが「---」を選択した状態では保存できない" do
        @order_shipping.prefecture_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end