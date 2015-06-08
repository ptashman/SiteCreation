class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :set_site_by_subdomain, only: [:index, :show, :new, :edit, :update, :destroy]

  def index
    @users = @site.users.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user_sign_in @user
      flash[:success] = "Welcome!"
      redirect_to user_url(id: @user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_url(id: @user.id)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def contact
    @user = User.find(params[:id])
    @current_user = User.find(params[:current_user_id])
    UserMailer.contact_request(@user, @current_user).deliver
    redirect_to :back, notice: "The user has been contacted!"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :site_id)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url(subdomain: @site.subdomain)) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url(subdomain: @site.subdomain)) unless current_user.admin?
    end
  end
