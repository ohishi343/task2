class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  has_one_attached :image
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
end
