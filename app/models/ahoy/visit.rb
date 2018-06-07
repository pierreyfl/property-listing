class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true

  def self.visitors_by_country(resource, id, view_by="year")

    visitors_ids = Ahoy::Event.visitors_ids(resource, id)
    Ahoy::Visit.where(id: visitors_ids)
      .group(:country)
      .where('started_at >= ?', 1.send(view_by.to_sym).ago)
      .count

  end


  def self.visits_by_hour(resource, id, view_by="year")

    visitors_ids = Ahoy::Event.visitors_ids(resource, id)
    Ahoy::Visit.where(id: visitors_ids)
      .where('started_at >= ?', 1.send(view_by.to_sym).ago)
      .group_by_hour(:started_at)
      .count

  end

  def self.visitors_by_source(resource, id, view_by="year")

    visitors_ids = Ahoy::Event.visitors_ids(resource, id)
    Ahoy::Visit.where(id: visitors_ids)
      .group(:referring_domain)
      .where('started_at >= ?', 1.send(view_by.to_sym).ago)
      .count
  end


end
