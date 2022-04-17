class Time < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '5分' },
    { id: 3, name: '10分' },
    { id: 4, name: '15分' },
    { id: 5, name: '20分' },
    { id: 6, name: '25分' },
    { id: 7, name: '30分' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end