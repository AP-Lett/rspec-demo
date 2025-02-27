class Order < ApplicationRecord
  validates :item_name,
    presence: true

  scope :cancelled, -> { where(cancelled: true) }
  scope :active, -> { where(cancelled: false) }
  scope :sort_latest, -> { order(created_at: :desc)}
  
end
