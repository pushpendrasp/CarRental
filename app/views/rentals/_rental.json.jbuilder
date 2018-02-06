json.extract! rental, :id, :car_license, :customer_email, :start_date, :end_date, :status, :created_at, :updated_at
json.url rental_url(rental, format: :json)
