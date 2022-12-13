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
        expect(@order_delivery_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_delivery_address.prefecture_id = 1
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("市町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery_address.address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'tel_numberが空だと保存できないこと' do
        @order_delivery_address.tel_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "tokenが空では登録できないこと" do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('郵便番号はハイフンを含めた半角文字列で入力してください (例：123-4567)')
      end
      it 'postal_codeが半角入力でないと保存できないこと' do
        @order_delivery_address.postal_code = '１２３−４５６７'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('郵便番号はハイフンを含めた半角文字列で入力してください (例：123-4567)')
      end
      it 'tel_numberはハイフンを含まない形式でないと保存できないこと' do
        @order_delivery_address.tel_number = '090-1234-5678'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'tel_numberが半角入力でないと保存できないこと' do
        @order_delivery_address.tel_number = '０９０１２３４５６７８'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'tel_numberが9桁以下では保存できないこと' do
        @order_delivery_address.tel_number = '090123456'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'tel_numberが12桁以上では保存できないこと' do
        @order_delivery_address.tel_number = '090123456789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("ユーザー情報を入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("商品情報を入力してください")
      end
    end
  end
end