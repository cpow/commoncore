class CommentsController < ApplicationController

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
     if @comment.save
       redirect_to :id => nil, :notice => "Successfully saved comment"
     else
       render :action => 'new'
     end
  end
end
