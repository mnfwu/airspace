class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_booking, only: [:destroy, :update]

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: @booking
    else
      render_error
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render_error
    end
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  def show_booking
    @booking = Booking.find(params[:booking_id])
  end

  def show_user_bookings
    @bookings = Booking.where("user_id = #{params[:user_id]}")
    @spaces = []
    @bookings.each do |booking|
      @spaces << Space.find(booking.space_id)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :start_date, :end_date, :confirmed, :additional_info, :space_id, :user_id, :owner_response, :number_of_people)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
