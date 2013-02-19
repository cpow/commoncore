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
end
