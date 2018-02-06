json.extract! car_suggestion, :id, :model, :manufacturer, :style, :created_at, :updated_at
json.url car_suggestion_url(car_suggestion, format: :json)
