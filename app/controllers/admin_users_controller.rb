class AdminUsersController < ApplicationController
  include PostHelper

  def new
    @user = AdminUser.new
  end

  def show
    @user = AdminUser.find(id: 1)
    # if authenticated? && session[:user_id] == User.find(params[:id]).id
    #   @user = User.find(params[:id])
    # else
    #   redirect_to '/posts'
    #   flash[:notice] = "Looks like you aren't authorized to see that page. Sorry."
    # end
  end

  def create
    @user = AdminUser.new(admin_user_params)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

    def admin_user_params
      params.require(:user).permit(:password, :username)
    end

end
