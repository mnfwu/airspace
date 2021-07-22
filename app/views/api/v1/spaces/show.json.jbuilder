json.extract! @space, :id, :title, :city, :description, :price, :category, :image_urls, :user_id, :address
@bookings = Booking.where("space_id = #{@space.id}")
json.bookings do
	json.array! @bookings do |booking|
		json.extract! booking, :id, :start_date, :end_date, :additional_info, :user_id, :space_id, :owner_response, :number_of_people
		json.user User.find(booking.user_id)
	end
end
