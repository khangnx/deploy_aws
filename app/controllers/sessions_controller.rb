class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => 'Wrong user or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "We have been logout" 
  end
end
