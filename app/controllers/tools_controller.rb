class ToolsController < ApplicationController
  before_action :authorizetool, only: %i[edit]

  def index
    @tools = Tool.all
    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude
      }
    end
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  # def show
  #   @tool = Tool.find(params[:id])
  #   authorize @tool
  # end

  def create
    @tool = Tool.new(tool_params)
    @tool.user_id = current_user
    if @tool.save
      redirect tools_path
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool = Tool.update(params[:tool])
    redirect_to tools_path
  end

  private

  def authorizetool
    authorize @tool
  end

  def tool_params
    params.require(:tool).permit(:name, :price_day, :price_deposit, :category, :description, :photos)
  end
end
