class PostsController < ApplicationController
  before_filter :authenticate_user!, :authenticate_blogger!, :except => [:index, :show]
  require 'will_paginate/array'

  def authenticate_blogger!
    unless current_user.has_role?(:blogger)
      redirect_to root_path, notice: "You are not authorized for this action"
    end
  end

  def index
    if params[:post_type]
      @posts = Post.where(post_type: params[:post_type]).paginate(page: params[:page])
    else
      @posts = Post.where(post_type: 'blog').paginate(page: params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end

  def update
    @post = Post.find(params[:id])


    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

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

  private

  def post_params
    params.require(:post).permit(:body, :title, :id, :user_id)
  end
end
