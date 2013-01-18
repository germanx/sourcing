class FirmsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_firm, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy]

  def index
     @firms = Firm.for(current_user)
  end

  def new
    @firm = Firm.new
  end

   def create
    @firm = Firm.new(params[:firm])
    @firm.firm = current_user.firm
    if @firm.save
      flash[:notice] = "Vendor has been created."
      redirect_to firms_path
    else
      flash[:alert] = "Vendor has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @firm.update_attributes(params[:firm])
      flash[:notice] = "Vendor has been updated."
      redirect_to firms_path
    else
      flash[:alert] = "Vendor has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @firm.destroy
    flash[:notice] = "Vendor has been deleted."
    redirect_to firms_path
  end

  private
 
    def find_firm
#      @firm = current_user.firms.find(params[:id])
      @firm = Firm.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The Vendor you were looking for could not be found."
      redirect_to firms_path
    end

end
