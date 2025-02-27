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
    #be_falsey checks if value returned by .valid? is any falsy value (false/nil)
    puts "-------------------"
    puts "Error: item_name #{order.errors[:item_name]}"
    puts "-------------------"
  end

  describe 'scopes' do

    describe '.cancelled' do
      it 'returns only cancelled orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order, cancelled: false)

        result = Order.cancelled
        expect(result).to include(cancelled_order)
        expect(result).not_to include(active_order)
      end
    end

    describe '.active' do 
      it 'returns only active orders' do
        active_order = create(:order, cancelled: false)
        cancelled_order = create(:order, cancelled: true)

        result = Order.active
        expect(result).to include(active_order)
        expect(result).not_to include(cancelled_order)
      end
    end

    describe '.sort_latest' do
      it 'returns orders from latest to oldest' do
        order1 = create(:order, created_at: Time.new(2025, 2, 27, 10, 0, 0))
        order2 = create(:order, created_at: Time.new(2025, 2, 27, 9, 0, 0))
        order3 = create(:order, created_at: Time.new(2025, 2, 27, 8, 0, 0))

        orders = Order.sort_latest

        expect(orders).to eq([order1, order2, order3])
      end
    end
  end

  describe 'cancellable' do

    describe '.cancel!' do
      it 'changes boolean for cancelled to be true' do
        order = create(:order, item_name: "Item 1", cancelled: false)
        order.cancel!
        expect(order.cancelled).to eq(true)
      end
    end

    describe '.uncancel!' do
      it 'changes boolean for cancelled to false' do
        order = create(:order, item_name: "Item 1", cancelled: true)
        order.uncancel!
        expect(order.cancelled).to eq(false)
      end
    end
  end
end