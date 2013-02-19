class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end
end
