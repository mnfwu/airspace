json.spaces do
  json.array! @spaces do |space|
    json.extract! space, :title, :city, :description, :price, :category, :image_urls, :user_id
  end
end