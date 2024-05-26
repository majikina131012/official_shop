class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :music
  
  validates :music_id, uniqueness: { scope: :customer_id }
end
