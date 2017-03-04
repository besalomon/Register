class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email_address: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in'
      redirect_to '/courses'
    else
      flash[:warning] = 'Invalid email or password'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
