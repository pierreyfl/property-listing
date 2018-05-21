class Agency < ApplicationRecord
  # use rolify for role assignment, see document: https://github.com/RolifyCommunity/rolify
  # if you need assign someone as +super_admin+ of the site, you need
  #   user.add_role :super_admin
  #
  # but if you want to assign a user as +agent+ of a agency, you need to pass a +resource+ as second argument
  #   agency = Agency.first
  #   user.add_role :agent, agency  # agency is the +resource+
  #
  # or assign a +agency_admin+ to a user, you can do this
  #   user.add_role :agency_admin, agency
  #
  resourcify
  has_attached_file :cover_photo
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
  has_many :agents
  has_one :user, as: :userable

  enum search_visibility: [:is_public,:is_private]

end
