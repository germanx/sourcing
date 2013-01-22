class ApplicationController < ActionController::Base
  protect_from_forgery
 
  private 

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def authorize_publisher!
    authenticate_user!
    unless current_user.publisher?
      flash[:alert] = "You must be a publisher to do that."
      redirect_to root_path
    end
  end
  
  def find_states
    @states = State.all
  end

  def find_user_firms
    @current_user_firms = Firm.for(current_user)
  end
end
