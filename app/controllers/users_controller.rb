class UsersController < ApplicationController
  def create
    @user = User.find_by(username: params[:userName])

    if !@user
      @user = User.create(username: params[:userName], password_digest: params[:password], is_master?: false)
      render json: @user.id
    else
      @message = 'This user already exists, please login or choose a different username'

      render json: @messsage
    end
  end
end
