json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :start_date, :end_date, :additional_info, :user_id, :space_id
  end
end
