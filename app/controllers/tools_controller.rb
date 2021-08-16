class ToolsController < ApplicationController
  def index
    if params[:query].present?
      @tools = Tool.where(title: params[:query])
    else
      @tools = Tool.all
    end
  end
end
