json.extract! classified_listing, :id, :title, :description, :created_at, :updated_at
json.url classified_listing_url(classified_listing, format: :json)
