class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :classified_listing

  accepts_nested_attributes_for :category, reject_if: :all_blank
end
