class ToolsController < ApplicationController

  authorize @tool
  def index
    if params[:query].present?
      @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
    else
      @tools = policy_scope(Tool).order(created_at: :desc)
    end

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
