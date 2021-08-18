class ToolsController < ApplicationController
  before_action :set_tool, only: %i[edit update destroy]

  def index
    if params[:category].present?
      # @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
      @tools = policy_scope(Tool).where(category: params[:category])
    else
      # @tools = policy_scope(Tool).order(created_at: :desc)
      @tools = policy_scope(Tool).all
      @tools = Tool.all
      @markers = @tools.geocoded.map do |tool|
        {
          lat: tool.latitude,
          lng: tool.longitude
        }
      end
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
    authorize @tool

  end

  def update
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool = Tool.update(params[:tool])
    redirect_to tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def tool_params
    params.require(:tool).permit(:name, :price_day, :price_deposit, :category, :description, :photos)
  end
end
