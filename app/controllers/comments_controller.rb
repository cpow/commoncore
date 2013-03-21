class CommentsController < ApplicationController
  before_filter :only_admin_user, :only => [:index]

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        commentable_object = $1.classify.constantize.find(value)
        return commentable_object if commentable_object.respond_to?(:comments)
      end
    end
    nil
  end

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        format.json {render json: @comment, status: :created, location: @comment}
        format.js {@comment}
      else
      end
    end
  end
end
