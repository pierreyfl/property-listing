class Agency < User
  has_many :agents
  has_many :social_links, as: :linkable
  has_many :properties, through: :agents
end
