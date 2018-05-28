class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true

  def self.visitors_by_country(resource, id, view_by="year")

    visitors = Ahoy::Event.where_props(
      "#{resource}_id".to_sym => id
    ).pluck(:visit_id).uniq
    
    Ahoy::Visit.where(id: visitors)
      .group(:country)
      .where('started_at >= ?', 1.send(view_by.to_sym).ago)
      .count

  end


  def self.visits_by_hour(resource, id, view_by="year")

    visitors = Ahoy::Event.where_props(
      "#{resource}_id".to_sym => id
    ).pluck(:visit_id).uniq

    Ahoy::Visit.where(id: visitors)
      .where('started_at >= ?', 1.send(view_by.to_sym).ago)
      .group_by_hour(:started_at).count

  end


end
