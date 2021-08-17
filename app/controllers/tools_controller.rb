class ToolsController < ApplicationController
  before_action :authorizetool, only: %i[edit]

  def index
    if params[:query].present?
      @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
    else
      @tools = policy_scope(Tool).order(created_at: :desc)
    end
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user_id = current_user
    if @tool.save
      redirect_to tools_path
    else
      render :new
    end
  end


  private

  def tool_params
    params.require(:tool).permit(:name, :price_day, :price_deposit, :category, :description, :photos)
  end

  def authorizetool
    authorize @tool
  end

  def edit
    @tool = Tool.find(params[:id])
    raise
  end

  def update
    @tool = Tool.find(params[:id])
    @tool = Tool.update(params[:tool])
    # redirect_to tool_path(@tool)
    redirect_to root
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price_day, :price_deposit, :name, :category, :description)
  end

end
