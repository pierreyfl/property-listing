class Agent < ApplicationRecord
  has_many :properties
  belongs_to :agency
  has_one :user, as: :userable
end
