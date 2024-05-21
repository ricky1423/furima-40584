require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべて入力すれば投稿できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_address.building_name = ''
        @purchase_address.valid?
      end
    end

    context '購入ができないとき' do
      it '郵便番号がないと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字でないと保存できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it '都道府県が必須であること。' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること。' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること。' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it '番地が必須であること。' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること。' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は、９桁以下は保存できない' do
        @purchase_address.phone_number = '00000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too short')
      end

      it '電話番号は、１２桁以上は保存できない' do
        @purchase_address.phone_number = '012345678912'
        @purchase_address.valid?
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
