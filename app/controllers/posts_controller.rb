class PostsController < ApplicationController
  def index
    @posts = Post.where(["name LIKE ?", "%#{params[:search]}"]) #search parameters
    @posts = Post.all.order("created_at DESC") #show all posts
  end

  def new
    @post = Post.new #open new post html
  end

  def create
    @post = Post.new(post_params) #calling create new posts

    if @post.save #if post use save post
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    #@posts = Post.where(["name LIKE ?", "%#{params[:search]}"])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id]) #calling edit html page
  end

  def destroy
    @post = Post.find(params[:id]) #finding respective post
    @post.delete #deleting the post

    redirect_to root_path #after deleting a post redirecting to root page

  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :group_id)
  end

  # def find_post
  # 	@post = Post.find(params[:id])
  # end

end

#s1498742
# Shenal Madurawalage Don