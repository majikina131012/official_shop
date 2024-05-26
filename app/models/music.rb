class Music < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
