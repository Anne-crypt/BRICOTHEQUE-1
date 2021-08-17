class ToolsController < ApplicationController
  before_action :authorizetool, only: %i[edit]

  def index
    if params[:query].present?
      @tools = policy_scope(Tool).order(created_at: :desc).where(title: params[:query])
    else
      @tools = policy_scope(Tool).order(created_at: :desc)
    end
  end


  private

  def authorizetool
    authorize @tool
  end
end
