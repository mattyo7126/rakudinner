class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cooking_time
  belongs_to :category
  belongs_to :quantity
  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 40 }
    validates :ingredients, length: { maximum: 1000 }
    validates :process, length: { maximum: 1000 }
    validates :point, length: { maximum: 100 }
  end

  validates :cooking_time_id, inclusion: { in: [1, 2, 3, 4, 5, 6] }
  validates :category_id, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] }
  validates :quantity_id, inclusion: { in: [1, 2, 3, 4, 5, 6] }

  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end
end
