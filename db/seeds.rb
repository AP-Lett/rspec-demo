Order.create!(item_name: "Sample Order 1", cancelled: false)
Order.create!(item_name: "Sample Order 2", cancelled: true)
Order.create!(item_name: "Sample Order 3", cancelled: false)
Order.create!(item_name: "Sample Order 4", cancelled: true)


Subscription.create!(name: "Sample Subscription 1", cancelled: false)
Subscription.create!(name: "Sample Subscription 2", cancelled: true)
Subscription.create!(name: "Sample Subscription 3", cancelled: false)
Subscription.create!(name: "Sample Subscription 4", cancelled: true)

user1 = User.create!(email: "abc@test.com", password: "abcdefg")
user2 = User.create!(email: "123@test.com", password: "1234567")