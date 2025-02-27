module Cancellable
  extend ActiveSupport::Concern

  included do
    scope :cancelled, -> { where(cancelled: true) }
    scope :active, -> { where(cancelled: false) }
    scope :sort_latest, -> { order(created_at: :desc)}
  end

  def cancel!
    update!(cancelled: true)
  end

  def uncancel!
    update!(cancelled: false)
  end
    
end