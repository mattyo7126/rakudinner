class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '肉料理' },
    { id: 2, name: '魚料理' },
    { id: 3, name: '野菜料理' },
    { id: 4, name: 'ご飯もの' },
    { id: 5, name: 'パスタ' },
    { id: 6, name: '麺・粉物' },
    { id: 7, name: '汁物・スープ' },
    { id: 8, name: 'サラダ' },
    { id: 9, name: 'おつまみ'},
    { id: 10, name: 'お菓子' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end