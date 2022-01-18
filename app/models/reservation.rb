class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :num_of_people, presence: true, numericality: { greater_than: 0 }
  validate :start_date_cannot_be_after_end_date, :start_date_cannot_be_in_the_past

  def start_date_cannot_be_after_end_date
    if start_date > end_date
      errors.add(:end_date, "終了日は開始日より前の日付にしてください。")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, ": 過去の日付は使えません")
    end
  end
end
