class Category < ApplicationRecord
  has_many :apartments, dependent: :destroy
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', required: false
  validates :name, presence: true
end
