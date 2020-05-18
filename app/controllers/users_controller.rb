class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @galleries = @user.galleries
  end

  def edit
  end
end
