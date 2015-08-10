class PostsController < ApplicationController
  skip_before_action :flash_attack, only: [:index, :new] #Why isnt this working?

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_userd
    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] =  "Post was updated"
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again"
      render :edit
    end
  end



end
