class Event < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :course

  validates :title, :start_date, :end_date, presence: true

  validate :start_end_check
  validate :start_check
  validate :start_limit_check
  validate :date_is_not_monday

  validates :start_date, event: true
  validates :end_date,   event: true

  default_scope -> { order(start_date: :desc) }
  
  def start_end_check
    errors.add(:end_date, "は開始時刻より遅い時刻を選択してください") if self.start_date >= self.end_date
  end

  def start_check
    errors.add(:start_date, "は現在の日時より遅い時間を選択してください") if self.start_date < Time.zone.now
  end

  def start_limit_check
    errors.add(:start_date, "は本日から2週間以内の日付を選択してください") if self.start_date >= Time.zone.now.since(15.days)
  end

  def date_is_not_monday
    errors.add(:start_date, "は月曜日は予約できません") if start_date.wday == 1
  end
end
