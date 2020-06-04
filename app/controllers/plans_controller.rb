class PlansController < ApplicationController
  def index
    @plans = Plan.order("price")
  end
  def link
 
  @post = Post.find(params[:post_id])
  @plan = Plan.find(params[:plan_id])
  end
end
