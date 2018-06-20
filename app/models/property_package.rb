class PropertyPackage < ApplicationRecord
    has_many :amenities
    has_many :subscriptions
    scope :standard, -> { where(listing_type: 'Standard') }
    scope :premium, -> { where(listing_type: 'Premium') }
    scope :feature, -> { where(listing_type: 'Feature') }
end
