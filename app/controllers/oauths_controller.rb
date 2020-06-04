# app/controllers/oauths_controller.rb
class OauthsController < ApplicationController
  skip_before_action :require_login
      
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end
      
  def callback
    provider = params[:provider]
    if @user = login_from(provider)
    
    
    #@id = Face.find_by_user_id current_user.id
      redirect_to :controller=>'welcome',  action: 'index', :id => @id , :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
        @user.activate!
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to :controller=>'welcome',  action: 'index', :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end
  
  #example for Rails 4: add private method below and use "auth_params[:provider]" in place of 
  #"params[:provider] above.

  # private
  # def auth_params
  #   params.permit(:code, :provider)
  # end

end