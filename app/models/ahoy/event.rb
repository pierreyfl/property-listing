class Ahoy::Event < ApplicationRecord

  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  scope :impressions_by_hour,
    -> (resource, id, view_by="year") {
      where_props("#{resource}_id".to_sym => id)
      .where('time >= ?', 1.send(view_by.to_sym).ago)
      .group_by_hour(:time)
      .count
    }

  scope :visitors_ids,
    -> (resource, id) {
      where_props("#{resource}_id".to_sym => id).pluck(:visit_id).uniq
    }

end
