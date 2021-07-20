require 'faker'

puts 'Creating Users'
puts '--------------'
20.times do
  user = User.new(
    username: Faker::Creature::Animal.name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  user.save!
  puts "Created user #{user.first_name}"
end
puts '******end******'

# spaces seed
puts 'Creating spaces'
puts '---------------'
20.times do
  categories = ['office', 'kitchen', 'event space']
  prices = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
  images = [
    'https://images.unsplash.com/photo-1592247350271-c5efb34dd967?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc1OTY3&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1600607686527-6fb886090705?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc2MDU4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1587316205943-b15dc52a12e0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc2MDgz&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1519642918688-7e43b19245d8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc2MTA2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc2MTYx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1560204717-850e441065fd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y293b3JraW5nfHx8fHx8MTYyNjY3NjE4OQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1614886137084-cfbc19a6656f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y293b3JraW5nfHx8fHx8MTYyNjY3NjIxMw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1519155031214-e8d583928bf2?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y293b3JraW5nfHx8fHx8MTYyNjY3NjIzNA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1532916123995-50bad0fc528e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y293b3JraW5nfHx8fHx8MTYyNjY3NjI0Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1564736676781-d0f57b29f67a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8cGFydHl8fHx8fHwxNjI2Njc2Mjc0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1605030936528-8d58d8fcf348?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY2NzYzMjU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1583244532610-2a234e7c3eca?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8cGFydHl8fHx8fHwxNjI2Njc2MzQx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1522050212171-61b01dd24579?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aG91c2V8fHx8fHwxNjI2Njc2Mzcx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aG91c2V8fHx8fHwxNjI2Njc2Mzk2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1559766569-d4a07c40fcce?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Z2FyZGVufHx8fHx8MTYyNjY3NjQzNA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8aW50ZXJpb3J8fHx8fHwxNjI2Njc2NTE4&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1574111249592-65c002336986?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY2NzY1NjQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1562771335-b1fe8b4ea78f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY2NzY1ODQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200'
  ]
  space = Space.new(
    category: categories.sample,
    price: prices.sample,
    image_urls: [images.sample],
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    title: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 4),
    description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 5),
    user_id: rand(1..10)
  )
  space.save!
  puts "Created space #{space.title}"
end
puts '******end******'

# reviews seed (don't need for now)
# bookings seed (don't neeed for now)
