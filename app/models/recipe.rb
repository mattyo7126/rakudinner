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
    validates :title
    validates :ingredients
    validates :process
  end

  with_options numericality: { other_than: 1 } do
    validates :cooking_time_id
    validates :category_id
    validates :quantity_id
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
