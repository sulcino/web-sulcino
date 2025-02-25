json.extract! message_of_the_day, :id, :user_id, :text_en, :text_cs, :created_at, :updated_at
json.url message_of_the_day_url(message_of_the_day, format: :json)
