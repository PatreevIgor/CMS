class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  validates   :title, :description, presence: true
end
