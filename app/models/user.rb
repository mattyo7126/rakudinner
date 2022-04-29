class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :password, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :email, presence: true
  validates :nickname, presence: true, length: { maximum: 6 }
  validates :cooking_history_id, presence: true, length: { maximum: 10 }
  validates :introduction, presence: true, length: { maximum: 40 }

end
