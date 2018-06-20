class Room < ApplicationRecord

  searchkick
  include Likeable

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

  PRICES = {
    50000 => '$50,000', 75000 => '$75,000', 100000 => '$100,000', 125000 => '$125,000', 150000 => '$150,000', 175000 => '$175,000', 200000 => '$200,000',
    225000 => '$225,000', 250000 => '$250,000', 275000 => '$275,000', 300000 => '$300,000', 325000 => '$325,000', 350000 => '$350,000', 375000 => '$375,000',
    400000 => '$400,000', 425000 => '$425,000', 450000 => '$450,000', 475000 => '$475,000', 500000 => '$500,000', 550000 => '$550,000', 600000 => '$600,000',
    650000 => '$650,000', 700000 => '$700,000', 750000 => '$750,000', 800000 => '$800,000', 850000 =>'$850,000', 900000 => '$900,000', 950000 => '$950,000',
    1000000 => '$1,000,000', 1100000 => '$1,100,000', 1200000 => '$1,200,000', 1300000 => '$1,300,000', 1400000 => '$1,400,000', 1500000 => '$1,500,000',
    1600000 => '$1,600,000', 1700000 => '$1,700,000', 1800000 => '$1,800,000', 1900000 => '$1,900,000', 2000000 => '$2,000,000', 2250000 => '$2,250,000',
    2500000 => '$2,500,000', 2750000 => '$2,750,000', 3000000 => '$3,000,000', 3500000 => '$3,500,000', 4000000 => '$4,000,000', 4500000 => '$4,500,000',
    5000000 => '$5,000,000', 6000000 => '$6,000,000', 7000000 => '$7,000,000', 8000000 => '$8,000,000', 9000000 => '$9,000,000', 10000000 => '$10,000,000',
    12000000 => '$12,000,000', 15000000 => '$15,000,000'
  }


  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :guest_reviews
  has_many :calendars

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  #validates :room_type, presence: true
  #validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
  
  def property_type
    case self.home_type
    when "0"
      "Any"
    when "1"
      "House"
    when "2"
      "Apartment"
    when "3"
      "Town house"
    when "4"
      "Villa"
    when "5"
      "Land"
    when "6"
      "Acreage"
    when "7"
      "Rural"
    when "8"
      "Block of Units"
    when "9"
      "Retirement Living"
    end
  end

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
