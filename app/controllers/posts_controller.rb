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
      flash[:notice] = 'Post created successfully'
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
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
      render action: 'edit'
    end
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
