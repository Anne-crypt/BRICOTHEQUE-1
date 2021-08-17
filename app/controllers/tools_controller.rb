class ToolsController < ApplicationController
  def index
    if params[:query].present?
      @tools = Tool.where(title: params[:query])
    else
      @tools = Tool.all
    end
  end

  def edit
    @tool = Tool.find(params[:id])
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
