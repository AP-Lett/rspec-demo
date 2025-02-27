require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'can create an subscription with the default factory' do
    subscription = create(:subscription)
    expect(subscription).to be_valid
    puts "-------------------"
    puts subscription.name
    puts "-------------------"
    puts subscription.cancelled
    puts "-------------------"
  end

  it 'expects subscription to be invalid if name is nil' do
    subscription = Subscription.new(name: nil)
    expect(subscription.valid?).to be_falsey
    #.valid? returns false if the object fails validation
    #be_falsey checks if value returned by .valid? is any falsy value (false/nil)
    puts "-------------------"
    puts "Error: name #{subscription.errors[:name]}"
    puts "-------------------"
  end

  describe 'scopes' do

    describe '.cancelled' do
      it 'returns only cancelled subscriptions' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription, cancelled: false)

        result = Subscription.cancelled
        expect(result).to include(cancelled_subscription)
        expect(result).not_to include(active_subscription)
      end
    end

    describe '.active' do 
      it 'returns only active subscriptions' do
        active_subscription = create(:subscription, cancelled: false)
        cancelled_subscription = create(:subscription, cancelled: true)

        result = Subscription.active
        expect(result).to include(active_subscription)
        expect(result).not_to include(cancelled_subscription)
      end
    end

    describe '.sort_latest' do
      it 'returns subscriptions from latest to oldest' do
        subscription1 = create(:subscription, created_at: Time.new(2025, 2, 27, 10, 0, 0))
        subscription2 = create(:subscription, created_at: Time.new(2025, 2, 27, 9, 0, 0))
        subscription3 = create(:subscription, created_at: Time.new(2025, 2, 27, 8, 0, 0))

        subscriptions = Subscription.sort_latest

        expect(subscriptions).to eq([subscription1, subscription2, subscription3])
      end
    end
  end

  describe 'cancellable' do

    describe '.cancel!' do
      it 'changes boolean for cancelled to be true' do
        subscription = create(:subscription, name: "Subscription 1", cancelled: false)
        subscription.cancel!
        expect(subscription.cancelled).to eq(true)
      end
    end

    describe '.uncancel!' do
      it 'changes boolean for cancelled to false' do
        subscription = create(:subscription, name: "Subscription 1", cancelled: true)
        subscription.uncancel!
        expect(subscription.cancelled).to eq(false)
      end
    end
  end
end
