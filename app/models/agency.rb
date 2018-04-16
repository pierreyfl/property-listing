class Agency < ApplicationRecord
  resourcify
  has_many :agents
  has_one :user, as: :userable
end
