class ToolsController < ApplicationController
  before_action :set_tool, only: %i[edit update destroy]

  def index
    if params[:category].present?
      # @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
      @tools = policy_scope(Tool).where(category: params[:category])
    elsif params[:search].present?
      @tools = policy_scope(Tool).search_global(params[:search][:query])
    else
      @tools = policy_scope(Tool).all
    end

      @markers = @tools.geocoded.map do |tool|
        {
          lat: tool.latitude,
          lng: tool.longitude,
          info_window: render_to_string(partial: "info_window", locals: { tool: tool }),
          image_url: helpers.asset_url("https://res.cloudinary.com/dasawfecj/image/upload/v1629378939/tools-solid_dog2qx.svg")
        }

    end
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
    @booking = Booking.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.address = @tool.address.nil? ? @tool.user.address : @tool.address
    authorize @tool
    if @tool.save
      redirect_to tools_path
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def update
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.update(tool_params)
    redirect_to tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def tool_params
    params.require(:tool).permit(:name, :price_day, :price_deposit, :category, :description, photos: [])
  end
end
