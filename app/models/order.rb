class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :billing_amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  enum payment_method: { credit_card: 0, transfer: 1, convenience_store: 2 }
  enum status: {wait_payment: 0, confirm_payment: 1, preparing_ship: 2, finish_prepare: 3}
end
