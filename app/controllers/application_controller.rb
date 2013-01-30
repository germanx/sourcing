class ApplicationController < ActionController::Base
  
  before_filter :set_i18n_locale_from_params

  protect_from_forgery
 
  private 

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:error] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def authorize_publisher!
    authenticate_user!
    unless current_user.publisher?
      flash[:error] = "You must be a publisher to do that."
      redirect_to root_path
    end
  end
  
  def find_states
    @states = State.all
  end

  def find_user_firms
    @current_user_firms = Firm.for(current_user)
  end

  def find_project_by_params_id
    @project = Project.readonly(false).for(current_user).find(params[:id])

    rescue ActiveRecord::RecordNotFound
    flash[:error] = "The project you were looking for could not be found."
    redirect_to projects_path
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = 
          "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
