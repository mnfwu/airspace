json.extract! @booking, :id, :start_date, :end_date, :additional_info, :user_id, :space_id, :owner_response, :number_of_people, :confirmed
json.user User.find(@booking.user_id)