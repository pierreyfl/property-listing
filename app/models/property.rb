class Property < ApplicationRecord

  self.inheritance_column = '_type'
  include Likeable
  belongs_to :user

  enum type: [:land, :apartment, :villa, :townhouse, :house]
  enum availability: [:inactive, :rent, :sale, :both]

  # this is a pending filter....
  bitmask :amenities, as: [
    :air_conditioning,
    :swimming_pool,
    :central_heating,
    :laundry_room,
    :gym,
    :alarm,
    :window_covering
  ] # note:- always add new vales at the end of bitmasked array

  def self.amenities
    self.bitmasks[:amenities]
  end
  # ....

  belongs_to :agent, class_name: 'User', foreign_key: :agent_id

  validates :type, presence: true

  searchkick locations: [:location]

  def search_data
    attributes.merge location: { lat: latitude, lon: longitude }
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
