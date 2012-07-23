class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    puts "*****************new***************************"
    @new_link = Link.new
  end

  def create
    puts "*****************create***************************"
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = "Link was created."
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
