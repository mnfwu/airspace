json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :start_date, :end_date, :additional_info, :user_id, :space_id
    json.space Space.find(booking.space_id)
  end
end
