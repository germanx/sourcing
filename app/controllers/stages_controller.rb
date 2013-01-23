class StagesController < ApplicationController

  before_filter :find_project_by_params_id, :only => [:edit]
  before_filter :find_states, :only => [:edit]

  def edit
    @states.each do |state|
      if !Stage.where(:project_id => @project, :state_id => state).exists?
        stage = @project.stages.build :state => state
        stage.project = @project
        stage.stage_start = Date.today
      end
    end
  end

  def update
  end
end
