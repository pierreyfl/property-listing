class ClassifiedListing < ApplicationRecord

  has_many :services, inverse_of: :classified_listing
  accepts_nested_attributes_for :services, reject_if: :all_blank, allow_destroy: true

  has_many :categorizations
  has_many :categories, through: :categorizations

  accepts_nested_attributes_for :categories, allow_destroy: :all_blank
  accepts_nested_attributes_for :categorizations
end
