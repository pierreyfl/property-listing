class PageView < ApplicationRecord
  belongs_to :trackable, polymorphic: true
end
