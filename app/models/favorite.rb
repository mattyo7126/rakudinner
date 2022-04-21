class Favorite < ApplicationRecord
  belogs_to :user
  belongs_to :recipe
end
