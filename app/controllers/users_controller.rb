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
    logger.debug("==========================================")
    logger.debug(params)
    logger.debug("==========================================")

    @user = User.new(user_params)

    logger.debug(@user.inspect)

    if @user.save(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # Edit action retrives the users and renders the edit page
  def edit
  end

  # Update action updates the user with the new information
  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # The show action renders the individual user after retrieving the the id
  def show
  end

  # The destroy action removes the user permanently from the database
  def destroy
    if @user.destroy
      redirect_to users_path
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:mobile)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
