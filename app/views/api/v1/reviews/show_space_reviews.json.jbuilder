json.reviews do
  json.array! @reviews do |review|
    json.extract! review, :content, :rating
  end
end
