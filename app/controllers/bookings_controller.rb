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

  def new
    @tool = Tool.find(params[:tool_id])
    @booking = booking.new
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(params_booking)
    @booking.tool = @tool
    if @booking.save
      redirect_to root
    else
      render :new
    end
  end

  private

  def params_booking
    params.require(:booking).permits(:start_date, :end_date, )
  end
end
