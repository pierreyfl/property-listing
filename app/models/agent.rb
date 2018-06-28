class Agent < User
  belongs_to :agency
  has_many :properties
  has_many :social_links, as: :linkable
  # Use polymorphic association, so that referer tracking can suit for multiple models
  #has_many :page_views, as: :trackable
  #enum search_visibility: [:is_public,:is_private]

end
