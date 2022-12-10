require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery_address.building_name = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_delivery_address.prefecture_id = 0
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery_address.address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空だと保存できないこと' do
        @order_delivery_address.tel_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角入力でないと保存できないこと' do
        @order_delivery_address.postal_code = '１２３−４５６７'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'tel_numberはハイフンを含まない形式でないと保存できないこと' do
        @order_delivery_address.tel_number = '090-1234-5678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Tel number is invalid.')
      end
      it 'tel_numberが半角入力でないと保存できないこと' do
        @order_delivery_address.tel_number = '０９０１２３４５６７８'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Tel number is invalid.')
      end
      it 'tel_numberが9桁以下でないと保存できないこと' do
        @order_delivery_address.tel_number = '090123456'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Tel number is invalid.')
      end
      it 'tel_numberが12桁以上でないと保存できないこと' do
        @order_delivery_address.tel_number = '090123456789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Tel number is invalid.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end