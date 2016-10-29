class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :delete]

  # Index action to render all users
  def index
    @users = User.all
  end

  # New action for creating user
  def new
    @user = User.new
  end

  # Create action saves the user into database
  def create
    @user = User.new
    if @user.save(post_params)
      flash[:notice] = "Successfully created user!"
      redirect_to post_path(@user)
    else
      flash[:alert] = "Error creating new user!"
      render :new
    end
  end

  # Edit action retrives the users and renders the edit page
  def edit
  end

  # Update action updates the user with the new information
  def update
    if @user.update_attributes(post_params)
      flash[:notice] = "Successfully updated users!"
      redirect_to post_path(@users)
    else
      flash[:alert] = "Error updating user!"
      render :edit
    end
  end

  # The show action renders the individual user after retrieving the the id
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @user.destroy
      flash[:notice] = "Successfully deleted user!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating user!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:mobile)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
