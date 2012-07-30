class CommentsController < ApplicationController
  before_filter :load_commentable

  def new
    #@comment = Comment.new
    @comment = @commentable.comments.new
  end

  def create
    @link = @commentable
    @comments = @link.comments
    @new_comment = @comments.new
    @new_comment.text = params[:comment][:text]
    @new_comment.user_id = current_user.id
    @new_comment.commentable_type = "Link"
    @new_comment.commentable_id = @commentable.id
    @new_comment.votes_count = 0
    @comment = @new_comment

    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to link_path(@comment.commentable_id)
    else
      flash[:notice] = "There was a problem creating your comment."
      render :new
    end
  end

  private
    def load_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end


end
