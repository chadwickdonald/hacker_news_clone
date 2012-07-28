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
    @new_link = Link.find(params[:id])
  end

  def show
    puts "*********************SHOW"
  end

  def update
    puts "*"*50
    @link = Link.find(params[:id])
    puts "*"*50
    puts @link
    @link.update_attributes(params[:link])
    flash[:message] = "Your link was updated!"
    redirect_to links_path
  end

  def destroy
  end
end
