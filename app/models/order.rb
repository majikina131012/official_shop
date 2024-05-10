class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :billing_amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  enum payment_method: { credit_card: 0, transfer: 1, convenience_store: 2 }
  enum status: {wait_payment: 0, confirm_payment: 1, preparing_ship: 2, finish_prepare: 3}
  
  def create_order_details(customer)
    unless order_details.first
      cart_items = customer.cart_items
      cart_items.each do |cart_item|
        item = cart_item.item
        OrderDetail.create!(
          order_id: id,
          item_id: item.id,
          purchase_price: item.with_tax_price,
          amount: cart_item.amount
        )
      end
    end
    cart_items.destroy_all
  end
end
