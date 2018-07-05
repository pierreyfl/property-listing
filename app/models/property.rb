class Property < ApplicationRecord
  self.inheritance_column = '_type'
  include Likeable
  # belongs_to :user
  belongs_to :agent

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

  belongs_to :agent, class_name: 'User', foreign_key: :agent_id, optional: true

  after_create :add_count_to_agent_and_agency
  after_destroy :subtract_count_to_agent_and_agency

  validates :type, presence: true

  searchkick locations: [:location]

  def search_data
    attributes.merge location: { lat: latitude, lon: longitude }
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  private

    def add_count_to_agent_and_agency
      if self.availability == "sale"
        agent_sold_properties = self.agent.num_of_sold_properties + 1
        self.agent.update_attributes(num_of_sold_properties: agent_sold_properties)
        agency_sold_properties = self.agent.agency.num_of_sold_properties + 1
        self.agent.agency.update_attributes(num_of_sold_properties: agency_sold_properties)
      elsif self.availability == "rent"
        agent_rent_properties = self.agent.num_of_rent_properties + 1
        self.agent.update_attributes(num_of_rent_properties: agent_rent_properties)
        agency_rent_properties = self.agent.agency.num_of_rent_properties + 1
        self.agent.agency.update_attributes(num_of_rent_properties: agency_rent_properties)
      end      
    end

    def subtract_count_to_agent_and_agency
      if self.availability == "sale"
        agent_sold_properties = self.agent.num_of_sold_properties - 1
        self.agent.update_attributes(num_of_sold_properties: agent_sold_properties)
        agency_sold_properties = self.agent.agency.num_of_sold_properties - 1
        self.agent.agency.update_attributes(num_of_sold_properties: agency_sold_properties)
      elsif self.availability == "rent"
        agent_rent_properties = self.agent.num_of_rent_properties - 1
        self.agent.update_attributes(num_of_rent_properties: agent_rent_properties)
        agency_rent_properties = self.agent.agency.num_of_rent_properties - 1
        self.agent.agency.update_attributes(num_of_rent_properties: agency_rent_properties)
      end 
    end

end
