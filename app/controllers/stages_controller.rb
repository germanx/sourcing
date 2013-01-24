class StagesController < ApplicationController

  before_filter :find_project_by_params_id, :only => [:edit]

  def edit
  end

  def update
  end
end
