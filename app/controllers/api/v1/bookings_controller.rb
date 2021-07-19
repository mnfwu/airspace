class Api::V1::BookingsController < Api::V1::BaseController
	before_action :find_booking, only: [:destroy]

	def create
		@booking = Booking.new(booking_params)
		@booking.save
		if @booking.save
			render :show, status: :created
		else
			render_error
		end
	end

	def destroy
		@booking.destroy
		head :no_content
	end

	def show_bookings
		@bookings = Booking.where("user_id LIKE '#{params[:user_id]}'")
	end

	private

	def space_params
		params.require(:booking).permit(:start_date, :end_date, :confirmed, :additional_info, :space_id, :user_id)
	end

	def find_booking
		@booking = Booking.find(params[:id])
	end
end
