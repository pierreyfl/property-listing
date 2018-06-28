class Agency < User
  has_many :agents
  has_many :social_links, as: :linkable
  accepts_nested_attributes_for :social_links, reject_if: :all_blank, allow_destroy: true
  has_many :properties, through: :agents
  has_one :user, as: :userable
  enum search_visibility: [:is_public,:is_private]

end
