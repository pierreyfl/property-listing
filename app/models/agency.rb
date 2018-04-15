class Agency < ApplicationRecord
  resourcify
  has_many :agents
end
