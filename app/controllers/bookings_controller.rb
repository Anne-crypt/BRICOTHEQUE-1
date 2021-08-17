class BookingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @bookings = policy_scope(Booking).where(status: 'pending')
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save
  end
end
