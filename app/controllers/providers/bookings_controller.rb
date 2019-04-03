class Providers::BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.update(booking_params)
    @booking.save

    redirect_to providers_bookings_path
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmed)
  end
end
