require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、email、password、password_confirmation、first_name、family_name、first_name_kana、family_name_kana、birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it '重複したnicknameが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが@を含んでいないと登録できないこと' do
      @user.email = 'hogefuga'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが6文字以上で半角英数字混合であれば登録できること' do
      @user.password = 'a11111'
      @user.password_confirmation = 'a11111'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上でも半角英数字混合でなければ登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1111'
      @user.password_confirmation = 'a1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'first_nameに全角（漢字・ひらがな・カタカナ）以外の文字を入力すると登録できないこと' do
      @user.first_name = '太ろu'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'family_nameに全角（漢字・ひらがな・カタカナ）以外の文字を入力すると登録できないこと' do
      @user.family_name = '田なka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end

    it 'first_name_kanaに全角カタカナ以外の文字を入力すると登録できないこと' do
      @user.first_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end

    it 'family_name_kanaに全角カタカナ以外の文字を入力すると登録できないこと' do
      @user.family_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end
  end
end
