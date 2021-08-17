class ToolsController < ApplicationController
  authorize @tool

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
  end
end
