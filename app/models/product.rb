class Product < ApplicationRecord
  # associations
  belongs_to :category
  has_many :order_items

  # validates
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  attr_accessor :image
  include PgSearch

  # mount_uploader :image, ImageUploader
  mount_uploader :image, ImageUploader

  pg_search_scope :search_by_full_name, against: [:name],
   using: {
    tsearch: {
      prefix: true
    }
   }
  
end
