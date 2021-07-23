require 'faker'

# users seed
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
40.times do
  categories = %w[work kitchen event]
  cities = %w[Shanghai Beijing Shenzhen Xiamen Ningbo Hangzhou Nanjing Chengdu Changsha Chongqing Shanghai Beijing Shanghai Beijing Shanghai Beijing Shenzhen Shenzhen Shanghai]
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
    'https://images.unsplash.com/photo-1562771335-b1fe8b4ea78f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY2NzY1ODQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1581706295818-79604988926a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY5MjA0MDY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1607702307367-0a49cc6ad6bb?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY5MjA0NTg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1580927942227-c7748860b1b0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjY5MjA0ODU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQyODM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1442975631115-c4f7b05b8a2c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQzMTM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1514933651103-005eec06c04b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQzMzM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1551887196-72e32bfc7bf3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQzNTQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1485686531765-ba63b07845a7?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQzOTM&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1549400405-810ac18d73b0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQ0MDU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1493857671505-72967e2e2760?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQ0MjI&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1463797221720-6b07e6426c24?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQ0MzY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1527192491265-7e15c55b1ed2?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8d29ya3NwYWNlfHx8fHx8MTYyNzAwNDQ3Mw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200',
    'https://images.unsplash.com/photo-1509870449717-5609536a5393?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=675&ixid=MnwxfDB8MXxyYW5kb218MHx8Y2FmZXx8fHx8fDE2MjcwMDQ1MjY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1200'
  ]
  space = Space.new(
    category: categories.sample,
    price: prices.sample,
    image_urls: [images.sample],
    city: cities.sample,
    address: Faker::Address.street_address,
    title: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 3),
    description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 5),
    user_id: User.all.sample.id
  )
  space.save!
  puts "Created space #{space.title}"
end
puts '******end******'

# reviews seed
puts 'Creating Reviews'
puts '--------------'
50.times do
  review = Review.new(
    user_id: User.all.sample.id,
    space_id: Space.all.sample.id,
    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 3),
    rating: rand(1..5)
  )
  review.save!
  puts "Created review with rating #{review.rating}"
end
puts '******end******'

# bookings seed (don't neeed for now)
