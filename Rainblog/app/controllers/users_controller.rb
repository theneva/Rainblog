class UsersController < ApplicationController

  RECENT_LIMIT = 5

#  before_filter(only: [:edit, :create, :update, :destroy]) do |c|
#    c.own_profile_required(params[:id], current_user)
#  end

#  def own_profile_required(user_id, current_user)
#    redirect_to root_url, notice: '' << user_id << ' ' << current_user.id << 'You have to be logged in to that profile in order to do that.' unless current_user && current_user.id == user_id
#  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find params[:id]
    @posts = Post.available_by_user(@user.id, current_user.nil? ? -1 : current_user.id).limit(RECENT_LIMIT)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        
        # Sign the user in on registering
        session[:user_id] = @user.id

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    reset_session

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  # GET /users/1/blog
  # GET /users/1/blog.json
  def blog
    @user = User.find(params[:id])
    @posts = Post.available_by_user(@user.id, current_user.nil? ? -1 : current_user.id).limit(RECENT_LIMIT)

    respond_to do |format|
      format.html # favorites.html.erb
      format.json { head :no_content }
    end
  end

  def search
    q = "%#{params[:query]}%" unless params[:query] == ""
    @users = User.where('username like ?', q)
  end
end
