require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it 'すべての情報が入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'introductionが空では登録できない' do
      @user.introduction = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Introduction can't be blank"
    end
    it 'cooking_history_idが空では登録できない' do
      @user.cooking_history_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Cooking history can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '1111aa'
      @user.password_confirmation = '11111a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'nicknameが7文字以上では登録できない' do
      @user.nickname = Faker::Name.initials(number: 7)
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname is too long (maximum is 6 characters)"

    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'aaa.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが全角文字を含むと登録できない' do
      @user.password = 'あ1111a'
      @user.password_confirmation = 'あ1111a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'introductionが41文字以上では登録できない' do
      @user.introduction = Faker::Lorem.characters(number: 41)
      @user.valid?
      expect(@user.errors.full_messages).to include "Introduction is too long (maximum is 40 characters)"
    end
  end
  end
end
