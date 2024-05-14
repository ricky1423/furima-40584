require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名前、カタカナ、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailには@が含まれていないと登録できない' do
      @user.email = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが数字だけだと登録できない' do
      @user.password = '11111111'
      @user.password_confirmation = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end

    it 'passwordが英字だけだと登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end

    it 'passwordが全角だと登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end

    it 'passwordとconfirmが一致していないと登録できない' do
      @user.password = 'test123'
      @user.password_confirmation = 'test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英数字混合でも6文字未満なら登録できない' do
      @user.password = 'test1'
      @user.password_confirmation = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'name_firstが空では登録できない' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first can't be blank")
    end

    it 'name_firstが半角では登録できない' do
      @user.name_first = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first is invalid. Input full-width characters')
    end

    it 'name_secondが空では登録できない' do
      @user.name_second = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name second can't be blank")
    end

    it 'name_secondが半角では登録できない' do
      @user.name_second = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name second is invalid. Input full-width characters')
    end

    it 'name_first_kanaが空では登録できない' do
      @user.name_first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first kana can't be blank")
    end

    it 'name_first_kanaが半角では登録できない' do
      @user.name_first_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first kana is invalid. Input full-width katakana characters')
    end

    it 'name_second_kanaが空では登録できない' do
      @user.name_second_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name second kana can't be blank")
    end

    it 'name_second_kanaが半角では登録できない' do
      @user.name_second_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name second kana is invalid. Input full-width katakana characters')
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

  end
end
