class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :reservations
  
  has_one_attached :image
  
  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
  validates :name, length: { maximum: 30 }
  validates :introduction, length: { maximum: 300 }
end
