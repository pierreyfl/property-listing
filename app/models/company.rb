class Company < ApplicationRecord
  belongs_to :classified_listing
  has_one_attached :logo
end
