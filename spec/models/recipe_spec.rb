require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  describe 'レシピの保存' do
    context 'レシピが保存できる場合' do
      it '選択項目が選択されていて、画像、入力項目がすべてあれば保存できる' do
        expect(@recipe).to be_valid
      end
      it '応用編のみ入力されていなくても保存できる' do
        @recipe.extra = ''
        expect(@recipe).to be_valid
      end
    end
    context 'レシピが保存できない場合' do
      it '料理写真がないと保存できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Image can't be blank"
      end
      it 'カテゴリが選択されていないと保存できない' do
        @recipe.category_id = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Category is not included in the list"
      end
      it '目安時間が入力されていないと保存できない' do
        @recipe.cooking_time_id = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Cooking time is not included in the list"
      end
      it '分量が入力されていないと保存できない' do
        @recipe.quantity_id = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Quantity is not included in the list"
      end
      it 'タイトルが入力されていないと保存できない' do
        @recipe.title = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Title can't be blank"
      end
      it '材料が入力されていないと保存できない' do
        @recipe.ingredients = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Ingredients can't be blank"
      end
      it '作り方が入力されていないと保存できない' do
        @recipe.process = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Process can't be blank"
      end
      it '時短・味付けポイントが入力されていないと保存できない' do
        @recipe.point = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Point can't be blank"
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "User must exist"
      end
      it 'タイトルが41文字以上だと保存できない' do
        @recipe.title = Faker::Lorem.characters(number: 41)
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Title is too long (maximum is 40 characters)" 
      end
      it '材料が1001文字以上だと保存できない' do
        @recipe.ingredients = Faker::Lorem.characters(number: 1001)
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Ingredients is too long (maximum is 1000 characters)"
      end
      it '作り方が1001文字以上だと入力できない' do
        @recipe.process = Faker::Lorem.characters(number: 1001)
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Process is too long (maximum is 1000 characters)"
      end
      it '時短・味付けポイントが101文字以上だと保存できない' do
        @recipe.point = Faker::Lorem.characters(number: 100)
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include "Point is too long (maximum is 1000 characters)" 
      end
    end
  end
end