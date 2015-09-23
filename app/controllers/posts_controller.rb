class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def index
    @site = Site.find(params[:site_id])
    @post  = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to :back
    else
      flash[:error] = "Post could not be created."
      redirect_to :back
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

    def post_params
      params.require(:post).permit(:wants_item, :has_item,
                                   :wants_description, :has_description, :site_id)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to site_welcome_url if @post.nil?
    end
end
