class Order < ApplicationRecord
  include Cancellable
  
  validates :item_name,
    presence: true

  
end
