puts "Creating Orders..."

# Order.create!(item_name: "Sample Order 1", cancelled: false)
# Order.create!(item_name: "Sample Order 2", cancelled: true)
# Order.create!(item_name: "Sample Order 3", cancelled: false)
# Order.create!(item_name: "Sample Order 4", cancelled: true)


Subscription.create!(item_name: "Sample Subscription 1", cancelled: false)
Subscription.create!(item_name: "Sample Subscription 2", cancelled: true)
Subscription.create!(item_name: "Sample Subscription 3", cancelled: false)
Subscription.create!(item_name: "Sample Subscription 4", cancelled: true)

puts "Seeded #{Order.count} orders."