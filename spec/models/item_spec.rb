require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品出品機能' do
    context '出品登録できるとき' do
      it 'すべて入力すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    

    context '出品ができないとき' do

        it '１枚画像がないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空欄だと出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品の説明が空欄だと出品できない' do
          @item.explain = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end

        it 'カテゴリーの情報が「---」だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it '商品の状態の情報が「---」だと出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it '配送料の負担の情報が「---」だと出品できない' do
          @item.shopping_free_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping free can't be blank")
        end

        it '発送元の地域の情報が「---」だと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '発送までの日数の情報が「---」だと出品できない' do
          @item.schedule_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Schedule can't be blank")
        end

        it '価格が空欄だと出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '価格が全角数値だと出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it '価格が数字以外だと出品できない' do
          @item.price = 'w'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it '価格の範囲が、300円未満だと出品できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it '価格の範囲が、9,999,999円を超えると出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end

      end
  end
end
