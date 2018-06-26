class Agent < User
  belongs_to :agency
  has_many :properties
  has_many :social_links, as: :linkable

  def photo
    self[:photo] || 'http://placeholder.pics/svg/300/DEDEDE/555555/agent%20photo'
  end
end
