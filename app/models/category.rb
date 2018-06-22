class Category < ApplicationRecord
  has_many :categorizations
  has_many :classified_listings, through: :categorizations
end
