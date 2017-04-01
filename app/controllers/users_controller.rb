class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_images = @user.images.paginate(:page => params[:page])
  end

end
