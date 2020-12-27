class Event < ApplicationRecord
  belongs_to :user

  validates :title, :start_date, :end_date, presence: true

  validate :start_end_check
  validate :start_check

  validates :start_date, event: true
  validates :end_date,   event: true
  
  def start_end_check
    errors.add(:end_date, "は開始時刻より遅い時刻を選択してください") if self.start_date >= self.end_date
  end

  def start_check
    errors.add(:start_date, "は現在の日時より遅い時間を選択してください") if self.start_date < Time.zone.now
  end
end
