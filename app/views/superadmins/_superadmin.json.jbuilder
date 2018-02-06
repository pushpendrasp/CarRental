json.extract! superadmin, :id, :name, :password, :email, :created_at, :updated_at
json.url superadmin_url(superadmin, format: :json)
