class UsersController < ApplicationController
  before_filter :require_login
    
  def show
  end

  def update
    current_user.update(user_params)
    respond_with(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
