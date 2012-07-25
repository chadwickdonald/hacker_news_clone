class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @new_link = Link.new
  end

  def create
    @new_link = Link.new(params[:link])
    @new_link.user_id = current_user.id
    if @new_link.save
      flash[:notice] = "Link was created."
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @new_link = Link.find(params[:link])
  end

  def show
  end

  def update
  end

  def destroy
  end
end
