class ToolsController < ApplicationController
  before_action :authorizetool, only: %i[edit]

  def index
    if params[:query].present?
      @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
    else
      @tools = policy_scope(Tool).order(created_at: :desc)
    end
  end

  def def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user_id = current_user
    raise
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
