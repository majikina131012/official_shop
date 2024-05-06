class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :item_id, uniqueness: { scope: :customer_id }
  validates :amount, presence: true
  
  def subtotal
    item.price_without_tax * amount
  end  
end
