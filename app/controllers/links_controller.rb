class LinksController < ApplicationController
  def index
    @links = Link.order('votes_count DESC')
  end

  def new
    @new_link = Link.new
  end

  def create
    @new_link = Link.new(params[:link])
    @new_link.user_id = current_user.id
    if @new_link.save
      flash[:notice] = "Your link was created."
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @new_link = Link.find(params[:id])
  end

  def show
    @link = Link.find(params[:id])
    @commentable = @link
    @comments = @commentable.comments
    @comment = Comment.new
    session[:source_link] = request.fullpath
  end

  def update
   
    @link = Link.find(params[:id])
    
    @link.update_attributes(params[:link])
    flash[:message] = "Your link was updated!"
    redirect_to links_path
  end

  def destroy
  end
end
