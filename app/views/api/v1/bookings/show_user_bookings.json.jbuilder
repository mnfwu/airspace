json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :start_date, :end_date, :additional_info, :user_id, :space_id, :owner_response, :number_of_people, :confirmed
    json.space Space.find(booking.space_id)
    json.user User.find(booking.user_id)
    @reviews = Review.where("space_id = #{booking.space_id}")
    @average_rating = 0
    @reviews.each do |review|
      @average_rating += review.rating
    end
    @reviews.length > 0 ? (@average_rating /= @reviews.length.to_f) : 0
    json.spaceaveragerating @average_rating
  end
end
