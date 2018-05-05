class Room < ApplicationRecord

  ACCOMADATION_TYPES = {
    0 => "Any", 1 => "House", 2 => "Apartment", 3 => "Town house", 4 => "Villa", 5 => "Land", 6 => "Acreage", 7 => "Rural", 8 => "Block of Units", 
    9 => "Retirement Living"
  }

  BED_ROOMS = {
    0 => "Any", 20 => "Studio", 1 => "1 Bed", 2 => "2 Beds", 3 => "3 Beds", 4 => "4 Beds", 5 => "5 Beds"
  }

  BATH_ROOMS = {
    0 => "Any", 20 => "Studio", 1 => "1 Bathroom", 2 => "2 Bathrooms", 3 => "3 Bathrooms", 4 => "4+ Bathrooms"
  }

  PRICES = [
    '$50,000', '$75,000', '$100,000', '$125,000', '$150,000', '$175,000', '$200,000', '$225,000', '$250,000', '$275,000', '$300,000', '$325,000', '$350,000', '$375,000', '$400,000',
    '$425,000', '$450,000', '$475,000', '$500,000', '$550,000', '$600,000', '$650,000', '$700,000', '$750,000', '$800,000', '$850,000', '$900,000', '$950,000', '$1,000,000',
    '$1,100,000', '$1,200,000', '$1,300,000', '$1,400,000', '$1,500,000', '$1,600,000', '$1,700,000', '$1,800,000', '$1,900,000', '$2,000,000', '$2,250,000', '$2,500,000',
    '$2,750,000', '$3,000,000', '$3,500,000', '$4,000,000', '$4,500,000', '$5,000,000', '$6,000,000', '$7,000,000', '$8,000,000', '$9,000,000', '$10,000,000', '$12,000,000', '$15,000,000'
  ]

  searchkick word_middle: [:summary, :address, :listing_name]

  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :guest_reviews
  has_many :calendars

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
