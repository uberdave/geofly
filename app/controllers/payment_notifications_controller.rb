class PaymentNotificationsController < ApplicationController
 protect_from_forgery :except => [:create]
 skip_before_action :require_login, only: [:create]
  def create
    PaymentNotification.create!(:post_id => params[:invoice], :params => params,  :status => params[:payment_status], :transaction_id => params[:txn_id])
  render :nothing => true
  end
  end

 