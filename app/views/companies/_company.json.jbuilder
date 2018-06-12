json.extract! company, :id, :name, :country, :state, :city, :street, :building, :zip_code, :email, :phone_number, :website, :logo, :created_at, :updated_at
json.url company_url(company, format: :json)
