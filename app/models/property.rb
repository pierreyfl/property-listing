class Property < ApplicationRecord

  self.inheritance_column = '_type'

  enum type: [:land, :apartment, :villa, :townhouse, :house]
  enum availability: [:inactive, :rent, :sale, :both]

  belongs_to :agent, class_name: 'User', foreign_key: :agent_id

  validates :type, presence: true

  searchkick

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def marker
    {
      lat:    self.latitude,
      lng:    self.longitude,
      title:  self.name.capitalize,
      infoWindow: {
        content: "<h4>#{self.name}</h4><p>#{self.address}</p>"
      }
    }
  end

end
