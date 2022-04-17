class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time
  belongs_to :category
  belongs_to :quantity

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :ingredients
    validates :process
  end  

  with_options numericality: { other_than: 1 } do
    validates :time_id
    validates :category_id
    validates :quantity_id
  end
end