json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :course_id
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event, format: :html)

  # json.color
  if event.end_date < Time.now
    json.color "gray"
  else
    json.color ""
  end
end