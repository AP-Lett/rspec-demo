class Subscription < ApplicationRecord
  include Cancellable
  
  validates :name, 
    presence: true
end
