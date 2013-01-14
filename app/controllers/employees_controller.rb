class EmployeesController < ApplicationController
  before_filter :authenticate_user!                  
  before_filter :find_firm 
  before_filter :find_employee, :only => [
                    :show,
                    :edit,
                    :update,
                    :destroy,
                    :user]
  def new
    @employee = @firm.employees.build
  end

  def create
    @employee = @firm.employees.build(params[:employee])
    if @employee.save
      flash[:notice] = "Employee has been created."
      redirect_to @firm
    else
      flash[:alert] = "Employee has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def user
    @user = User.create(:email => @employee.email, :password => "123456")

    if @user.save
        @employee.user_id = @user.id
        if @employee.update_attributes(params[:employee])
          flash[:notice] = "User has been created."
        else
          flash[:alert] = "User has not been linked to employee."
        end  
    else
      flash[:alert] = "User has not been created."
    end
    redirect_to @firm
  end

  def update
    if @employee.update_attributes(params[:employee])
      flash[:notice] = "Employee has been updated."
      redirect_to @firm
    else
      flash[:alert] = "Employee has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @employee.destroy
    flash[:notice] = "Employee has been deleted."
    redirect_to @firm
  end

  private
    
    def find_firm
      @firm = Firm.find(params[:firm_id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The Vendor you were looking for could not be found."
        redirect_to firms_path
    end

    def find_employee
      @employee = @firm.employees.find(params[:id])
    end
end
