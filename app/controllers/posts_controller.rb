class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new(flash[:board])
  end

  def create
    post = Post.create(post_params)
    post = Post.new(post_params)
    if post.save
      flash[:notice] = "「#{post.title}」の記事が投稿されました!"
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    # @comment = @post.comments.new
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    flash[:notice] = "「#{post.title}」の記事が投稿されました!"
    post.update(post_params)

    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    flash[:notice] = "「#{post.title}」の記事が投稿されました!"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :title, :content)
  end
end