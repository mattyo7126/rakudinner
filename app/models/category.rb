class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '肉料理' },
    { id: 3, name: '魚料理' },
    { id: 4, name: '野菜料理' },
    { id: 5, name: 'ご飯もの' },
    { id: 6, name: 'パスタ' },
    { id: 7, name: '麺・粉物' },
    { id: 8, name: '汁物・スープ' },
    { id: 9, name: 'サラダ' },
    { id: 10, name: 'おつまみ'},
    { id: 11, name: 'お菓子' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end