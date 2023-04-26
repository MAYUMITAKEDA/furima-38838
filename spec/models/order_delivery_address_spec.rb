require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '商品購入情報の保存' do
    before do 
      user = FactoryBot.create(:user)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id)
    end

    context '内容に問題がないとき' do
      it '配送先情報のすべての値が正しく入力されていれば保存できる' do
        expect(@order_delivery_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_delivery_address.building = ''
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題があるとき' do
      it 'postal_codeが空の場合は保存できない' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは「3桁+ハイフン（-）+4桁」でなければ保存できない' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角の場合は保存ができない' do
        @order_delivery_address.postal_code = '１２３−４５６７'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが空の場合は保存ができない' do
        @order_delivery_address.prefecture_id = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idに「----」選択されている場合は保存ができない' do
        @order_delivery_address.prefecture_id = 1
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合は保存ができない' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空の場合は保存ができない' do
        @order_delivery_address.addresses = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空の場合は保存ができない' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字の場合は保存ができない' do
        @order_delivery_address.phone_number = '０９０１２３４５６７８'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが10桁未満の場合は保存ができない' do
        @order_delivery_address.phone_number = '09012345'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberにハイフン（-）が含まれている場合は保存ができない' do
        @order_delivery_address.phone_number = '090-1234-5678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'Userが結びついていない場合は保存ができない' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User must exist")
      end
      it 'Itemが結びついていない場合は保存ができない' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item must exist")
      end
      it 'tokenが空では保存ができない' do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end