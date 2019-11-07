class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
      flash[:notice] = "Your Post was created successfully"
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Your Post was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Your Post was deleted successfully"
  end

  private
    def post_params
      params.require(:post).permit(:date, :rational,:status )
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
