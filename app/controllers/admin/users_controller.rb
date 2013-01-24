class Admin::UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  before_filter :find_user_firms, :only => [:new, :edit]
  before_filter :store_referer, :only => [:new, :edit]

  def index
    @users = User.all(:order => "email")
  end

  def new
    @user = User.new
    @user.firm_id = params[:firm_id]
  end

  def create
    @user = User.new(params[:user])
    @user.admin = params[:user][:admin] == "1"

    set_admin
    if @user.save
      flash[:success] = "User has been created."
      redirect_to session[:return_to]
    else
      flash[:error] = "User has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    set_admin  
    if @user.update_attributes(params[:user])
      flash[:success] = "User has been updated."
      redirect_to session[:return_to]
    else
      flash[:error] = "User has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    if @user == current_user
      flash[:error] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:success] = "User has been deleted."
    end
    redirect_to admin_users_path
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def set_admin
      @user.admin = params[:user][:admin] == "1"
    end

    def store_referer
      session[:return_to] ||= request.referer
    end
end
