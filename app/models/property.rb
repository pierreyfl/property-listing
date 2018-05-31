class Property < ApplicationRecord

  self.inheritance_column = '_type'

  enum type: [:land, :apartment, :villa, :townhouse, :house]
  enum availability: [:inactive, :rent, :sale, :both]

  belongs_to :agent, class_name: 'User', foreign_key: :agent_id

  validates :type, presence: true

  searchkick

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
