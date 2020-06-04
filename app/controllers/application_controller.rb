
class ApplicationController < ActionController::Base
# app/controllers/application_controller.rb
before_action:require_login
include Mobylette::RespondToMobileRequests
private
	def not_authenticated
	  redirect_to login_path, alert: "Please login first"
	end
end
