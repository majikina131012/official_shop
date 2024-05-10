class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :item_id, uniqueness: { scope: :order_id }
  validates :purchase_price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
  
  enum preparation_status:
    {
      not_ready: 0,
      preparation: 1,
      finish: 2,
      shipping_completed: 3
    }
    
    def subtotal
      purchase_price * amount
    end
end
