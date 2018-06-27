class Agent < User
  belongs_to :agency
  has_many :properties
  has_many :social_links, as: :linkable

end
