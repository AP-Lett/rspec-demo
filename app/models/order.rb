class Order < ApplicationRecord
  validates :item_name,
    presence: true

end
