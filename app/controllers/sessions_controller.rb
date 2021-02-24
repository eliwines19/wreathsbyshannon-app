class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    if logged_in?
      redirect_to '/admin'
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/admin'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to '/admin'
  end

  def welcome
  end

end
