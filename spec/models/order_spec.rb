require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'can create an order with the default factory' do
    order = create(:order)
    expect(order).to be_valid
    puts "-------------------"
    puts order.item_name
    puts "-------------------"
    puts order.cancelled
    puts "-------------------"
  end

  it 'expects Order to be invalid if item_name is nil' do
    order = Order.new(item_name: nil)
    expect(order.valid?).to be_falsey
    #.valid? returns false if the object fails validation
  end
end