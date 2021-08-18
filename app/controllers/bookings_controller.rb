class BookingsController < ApplicationController
  before_action :set_tool, only: %i[new create]
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

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.tool = @tool
    @booking.user = current_user
    authorize @booking
    save_the_booking(@booking)
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end

  def save_the_booking(booking)
    if booking.save && booking.end_date >= booking.start_date
      flash[:notice] = "Successfully booked the #{booking.tool.name}, wait for #{booking.tool.user.first_name} #{booking.tool.user.last_name} to confirm your booking"
      redirect_to '/'
    elsif booking.end_date < booking.start_date
      flash[:alert] = "make sure your end-date is later or equal to your start-date"
      redirect_to new_tool_booking_path
    else
      render :new
    end
  end
end
