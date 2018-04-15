class Agent < ApplicationRecord
  has_many :properties
  belongs_to :agency
  has_one :user, as: :userable

  has_attached_file :photo
  has_attached_file :cover_photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
end
