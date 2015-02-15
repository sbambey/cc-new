class BlogPostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_unless_admin, except: [:index, :show]

  def index
  	@blog_posts = BlogPost.all	
  end

  def show
  	@blog_post = BlogPost.friendly.find(params[:id])
  end

  def new
  	@blog_post = current_user.blog_posts.build
  end

  def create
  	@blog_post = User.find(params[:user_id]).blog_posts.new(blog_post_params)
  	if @blog_post.save
  		redirect_to show_blog_post_path(@blog_post)
  	else
  		render "new"
  	end
  end

  def edit
  	@blog_post = BlogPost.friendly.find(params[:id])
  end

  def update
  	@blog_post = BlogPost.friendly.find(params[:id])
  	@blog_post.update_attributes(blog_post_params)
  end

  def destroy
  end

  private

	def blog_post_params
		params.require(:blog_post).permit(:user_id, :title, :subtitle, :content)
  end
end
