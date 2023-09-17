class CommentsController < ApplicationController
  def create #create a comment
    @post = Post.find(params[:post_id]) #finding post
    @comment = @post.comments.create(params[:comment].permit(:name, :comment))
    redirect_to post_path(@post)
  end

  def destroy #deleting post
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
#s1498742
# Shenal Madurawalage Don