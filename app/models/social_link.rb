class SocialLink < ApplicationRecord

  enum site: [:facebook, :gplus, :twitter, :linkedin]

  belongs_to :linkable, polymorphic: true
end
