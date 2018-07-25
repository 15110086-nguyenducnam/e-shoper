class OrderItem < ApplicationRecord
  # acssociations
  belongs_to :product
  belongs_to :order

  # validates
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  validate :oder_present

  # triger
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

   private
   def product_present
     if product.nil?
       error.add(:product, "is not valid or is not active")
     end
   end
   def oder_present
     if order.nil?
       errors.add(:order, "is not a valid order")
     end
   end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
