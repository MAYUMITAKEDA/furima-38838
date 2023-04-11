require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての情報が存在する場合に出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが添付されていない場合、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameは40文字以内でなければ出品できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'detailが空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'detailは1000文字以内でなければ出品できない' do
        @item.detail = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Detail is too long (maximum is 1000 characters)')
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_charge_idが空では出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが空では出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが299円以下では出品できない' do
        @item.item_price = '290'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
      it 'item_priceが10,000,000円以上では出品できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
      it 'item_priceが全角数字の場合は出品できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
