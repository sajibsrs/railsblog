class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to(@post, notice: 'Post created successfully')
    else
      redirect_to(new_post_path, alert: @post.errors.full_messages)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to(@post, notice: 'Post updated successfully')
    else
      redirect_to edit_post_path
    end
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
