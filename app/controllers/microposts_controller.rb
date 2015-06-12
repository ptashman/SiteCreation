class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_site_by_subdomain, only: [:index, :destroy]

  def index
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to :back
    else
      #@feed_items = []
      flash[:error] = "Micropost could not be created."
      redirect_to :back
    end
  end

  def destroy
    @micropost.destroy
    redirect_to :back
  end

  private

    def micropost_params
      params.require(:micropost).permit(:wants_item, :has_item,
                                        :wants_description, :has_description, :site_id, :wants_image, :has_image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url(subdomain: @site.subdomain) if @micropost.nil?
    end
end
