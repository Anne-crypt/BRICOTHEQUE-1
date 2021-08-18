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
    if @booking.save
      flash[:notice] = "Successfully booked the #{@tool.name}, wait for #{@tool.user.first_name} #{@tool.user.last_name} user to confirm your booking"
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end
end
