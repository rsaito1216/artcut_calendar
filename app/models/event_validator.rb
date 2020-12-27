class EventValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 新規登録する期間
    new_start_date = record.start_date
    new_end_date   = record.end_date

    return unless new_start_date.present? && new_end_date.present?

     # 重複する期間を検索(編集時は自期間を除いて検索)
    if record.id.present?
      not_own_events = Event.where('id NOT IN (?) AND start_date < ? AND end_date > ?', record.id, new_end_date, new_start_date)
    else
      not_own_events = Event.where('start_date < ? AND end_date > ?', new_end_date, new_start_date)
    end

    record.errors.add(attribute, 'は既に別のお客様が予約している時間帯です') if not_own_events.present?
  end
end