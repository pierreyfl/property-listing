class Agent < ApplicationRecord
  has_many :properties
  has_many :social_links, as: :linkable
  belongs_to :agency
  has_one :user, as: :userable

  has_attached_file :photo
  has_attached_file :cover_photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

  # Use polymorphic association, so that referer tracking can suit for multiple models
  has_many :page_views, as: :trackable

  enum search_visibility: [:is_public,:is_private]
end
