class Product < ApplicationRecord
  attr_accessor :image
  belongs_to :category
  has_many :order_items
  include PgSearch
  pg_search_scope :search_by_full_name, against: [:name],
   using: {
    tsearch: {
      prefix: true
    }
   }
  # mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  mount_uploader :image, ImageUploader
end
