class ClassifiedListing < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations

  accepts_nested_attributes_for :categories, allow_destroy: :all_blank
  accepts_nested_attributes_for :categorizations
end
