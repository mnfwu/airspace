json.reviews do
  json.array! @reviews do |review|
    json.extract! review, :content, :rating, :user_id, :created_at
    json.user User.find(review.user_id)
  end
end
