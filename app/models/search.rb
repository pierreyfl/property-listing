class Search < ApplicationRecord
  serialize :conditions, Hash
  belongs_to :user
end
