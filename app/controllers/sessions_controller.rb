class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:user][:userName])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render json: user
    end
  end

  def destroy
    params[:id] = nil
  end
end