class PostsController < ApplicationController
 skip_before_action :require_login, only: [:index, :show, :paste, :share]
  # GET /posts
  # GET /posts.json

  def index
      if current_user
      @current_user = current_user
      
      end
     if cookies[:lat_lng]
      @lat_lng = cookies[:lat_lng].split("|")
      lat, lng = @lat_lng[0], @lat_lng[1]
      range =cookies[:range]
      range = (range.to_f / 1000)
      @posts = Post.near([lat,lng],range, :units => :km)
      
      @lat   = @lat_lng[0]
      @lng   = @lat_lng[1]
      @dave  = Post.find_by_id(94)
   
     respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @post }
       
      end
      else
        redirect_to root_path, notice: 'Sorry, I somehow lost your range setting. Please try again' 
    end
      
     
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  @post = Post.find(params[:id])
   if cookies[:lat_lng]
    @lat_lng = cookies[:lat_lng].split("|")
     @lat   = @lat_lng[0]
     @lng   = @lat_lng[1]
     @range =cookies[:range]
    
    #@distance = Post.distance
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    #redirect_to root_path, notice: 'Sorry, I somehow lost your range setting. Please try again' 
    end
    end
    
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
     @lat_lng = cookies[:lat_lng].split("|")
     @lat   = @lat_lng[0]
     @lng   = @lat_lng[1]
     @post = Post.new

     
      
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if cookies[:lat_lng]
   @lat_lng = cookies[:lat_lng].split("|")
     @lat   = @lat_lng[0]
     @lng   = @lat_lng[1]
     end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
      if current_user.id == @post.user_id
          respond_to do |format|
          if @post.update_attributes(params[:post])
             format.html { redirect_to @post, notice: 'Post was successfully updated.' }
             format.json { head :no_content }
         else
            format.html { render action: "edit" }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
          end
     else
       respond_to do |format|
       format.html { render action: "edit" }
       format.json { render json: @post.errors, status: :unprocessable_entity }
       end
     end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    

    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  def login_menu
  end
    # GET /mygpstags
  def tag
   if cookies[:lat_lng]
      @lat_log = cookies[:lat_lng].split("|")
      lat, lng = @lat_log[0], @lat_log[1]
      
      radius = 41666
      
      #radius = (radius.to_f / 1000)
      @posts = Post.near([lat,lng],radius, :units => :km).where(:user_id => current_user.id)
      
      @lat   = @lat_log[0]
      @lng   = @lat_log[1]
      #@dave  = Post.find_by_id(94)
      
  #@posts = Post
  respond_to do |format|
      format.html 
      format.json { render json: @post }
      end
     
    else
    redirect_to root_path, notice: 'Sorry, I somehow lost your  cookies. Please try again, by stating at the Home page.' 
  end
  end
  def paste
  
   @post =Post.find_by_id(params[:post_id])
   
   if current_user
   
   if Profile.find_by_user_id(current_user.id)
   @profile = Profile.find_by_user_id(current_user.id)
if @post.profiles.find_by_user_id(current_user.id)
 @post.profiles.delete(@profile)
end

   if @post.profiles << @profile
      respond_to do |format|
        format.html { redirect_to profiles_url(:post_id => @post.id), notice: 'Face was successfully Pasted.' }
        format.json { render json: @post, status: :created, location: @post }
        end
   else
    respond_to do |format|
      format.html { render 'posts/index'}
      format.json { render json: @users }
      end 
   
   end 
   else
   respond_to do |format|
        format.html { redirect_to new_profile_url }
        end
     end
end
end






def erase
   @post =Post.find_by_id(params[:post_id])
   if current_user
   if Profile.find_by_user_id(current_user.id)
   @profile = Profile.find_by_user_id(current_user.id)

   if @post.profiles.delete(@profile)
      respond_to do |format|
        format.html { redirect_to profiles_url(:post_id => @post.id), notice: 'Face was successfully Pasted.' }
        format.json { render json: @post, status: :created, location: @post }
        end
   else
    respond_to do |format|
      format.html { render 'posts/index'}
      format.json { render json: @users }
      end 
   
   end 
   end
   end
   end
    #/share/user
  def share
  @user = params[:user]
  lat = 30.682596389889916
   lng = -87.04221096789813
      
      radius = 41666
      
      #radius = (radius.to_f / 1000)
      @posts = Post.near([lat,lng],radius, :units => :km).where(:user_id => @user)
      
      
  respond_to do |format|
      format.html 
      format.json { render json: @post }
      end
     
    
  end
end
