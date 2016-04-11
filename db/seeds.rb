10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

user = User.new
user.email = 'test@example.com'
user.encrypted_password = '#$taawktljasktlw4aaglj'
user.save!

user2 = User.new
user2.email = 'test2@example.com'
user2.encrypted_password = '#2$taawktljasktlw4aaglj'
user2.save!
