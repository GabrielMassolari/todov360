class DashboardsController < ApplicationController
  def index
    @lists = current_user.lists.all
    @tasks = current_user.tasks.all
  end
end
