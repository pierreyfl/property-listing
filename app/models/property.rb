class Property < ApplicationRecord

  self.inheritance_column = '_type'

  enum type: [:land, :apartment, :villa, :townhouse, :house]
  enum availability: [:inactive, :rent, :sale, :both]

  belongs_to :agent, class_name: 'User', foreign_key: :agent_id

  validates :type, presence: true

  searchkick locations: [:location]

  def search_data
    attributes.merge location: { lat: latitude, lon: longitude }
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
