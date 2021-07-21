class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_booking, only: [:destroy]

  def create
    @booking = Booking.new(booking_params)
    # @booking.save
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

  def show_user_bookings
    @bookings = Booking.where("user_id = #{params[:user_id]}")
    @spaces = []
    @bookings.each do |booking|
      @spaces << Space.find(booking.space_id)
    end
  end

  private

  def space_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed, :additional_info, :space_id, :user_id)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
