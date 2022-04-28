require 'rails_helper'
describe "RecipeController", type: :request do

  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.create(:recipe)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのレシピの画像URLが存在する' do
      get root_path
      expect(response.body).to include(url_for(@recipe.image))
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのレシピのタイトルが存在する' do 
      get root_path
      expect(response.body).to include(@recipe.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのレシピの目安時間が存在する' do
      get root_path
      expect(response.body).to include(@recipe.cooking_time.name)
    end
  end

  before do
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.create(:recipe)
  end
  
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get recipe_path(@recipe.id)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の画像が存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(url_for(@recipe.image))
    end
    it 'showアクションにリクエストするとレスポンスに投稿済のカテゴリが存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.category.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の目安時間が存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.cooking_time.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の分量が存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.quantity.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済のタイトルが存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の材料が存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.ingredients)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の作り方が存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.process)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済の時短・味付けポイントが存在する' do
      get recipe_path(@recipe.id)
      expect(response.body).to include(@recipe.point)
    end

  
  end
end