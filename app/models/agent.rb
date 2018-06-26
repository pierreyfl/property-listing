class Agent < User
  belongs_to :agency
  has_many :properties
  has_many :social_links, as: :linkable

  def photo
    'https://placeimg.com/150/150/people'
  end

end
