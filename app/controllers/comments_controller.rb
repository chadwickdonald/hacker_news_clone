class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(:user_id => current_user.id, :text => params[:text])

    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to links_path
    else
      flas[:notice] = "There was a problem creating your comment."
      render :new
    end

  end

end
