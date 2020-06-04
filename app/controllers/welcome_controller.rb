class WelcomeController < ApplicationController
 skip_before_action :require_login
 

    
   
def index
    cookies.delete :range
    cookies.delete :lat_lng 
  #respond_to do |format|
  #   format.html  {render index.html.erb }
 
    end
end


   # respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @faces }
    #end
 
  def privacy
  respond_to do |format|
      format.html # privacy.html.erb
      format.json { render json: @faces }
    end
end

 def help
  respond_to do |format|
      format.html # help.html.erb
      format.json { render json: @faces }
    end

end

