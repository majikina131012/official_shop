class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  validates :billing_amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
