class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :recipes

  validates :password, presence: true
  validates :email, presence: true
  validates :nickname, presence: true
  validates :cooking_history_id, presence: true
  validates :introduction, presence: true
end
