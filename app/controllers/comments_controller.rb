class CommentsController < ApplicationController
  before_filter :only_admin_user, :only => [:index]

  def index
    @commentable = PolymorphicObjectBuilder.new(params, "comments").find_polymorphic_object
    @comments = @commentable.comments
  end

  def create
    @commentable = PolymorphicObjectBuilder.new(params, "comments").find_polymorphic_object
    @comment = @commentable.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.json {render json: @comment, status: :created, location: @comment}
        format.js {@comment}
      else
      end
    end
  end

  def comment_params
    params.require(:comment).permit!
  end
end
