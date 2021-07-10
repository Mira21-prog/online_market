class Note < ApplicationRecord
  belongs_to :user
  belongs_to :project
  scope :search, ->(term){ where("LOWER(message) LIKE ?", "%#{term.downcase}%") }
end
