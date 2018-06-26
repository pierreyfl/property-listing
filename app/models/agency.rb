class Agency < User
  has_many :agents
  has_many :social_links, as: :linkable
  accepts_nested_attributes_for :social_links, reject_if: :all_blank, allow_destroy: true

  has_many :properties, through: :agents
end
