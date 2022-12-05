require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "情報を全て正しく入力すれば新規作成できる" do
        expect(@item).to be_valid
      end
    end
    context '新規作成できない場合' do
      it '添付画像が無いと作成できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では作成できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'describeが空では作成できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'category_idが未選択（ーー）のままでは作成できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが未選択（ーー）のままでは作成できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_status_idが未選択（ーー）のままでは作成できない' do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_idが未選択（ーー）のままでは作成できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_duration_idが未選択（ーー）のままでは作成できない' do
        @item.delivery_duration_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery duration can't be blank")
      end
      it 'priceが空では作成できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では作成できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では作成できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字では作成できない' do
        @item.price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end