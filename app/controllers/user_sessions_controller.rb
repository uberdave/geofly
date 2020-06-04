# app/controllers/user_sessions_controller.rb
class UserSessionsController < ApplicationController
 
 skip_before_action :require_login, except: [:destroy] 
  #force_ssl :only =>  [:new, :create]
  def new
    @user = User.new
    
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_url, :notice => "Logged in!" #(:users, notice: 'Login successful')
    else
      flash.now[:alert] = "Login failed"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!" #(:users, notice: 'Logged out!')
  end
  
  def face_javascript
  end
end