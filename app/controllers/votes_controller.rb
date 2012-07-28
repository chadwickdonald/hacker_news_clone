class VotesController < ApplicationController
  def create

    @vote = Vote.new(:votable_id => params[:link_id], :votable_type => 'Link', :user_id => current_user.id, :value => 1)

    vote =  Vote.find_by_user_id_and_votable_id(current_user.id, params[:link_id])
    if vote
      flash[:notice] = "You already voted on this link."
      redirect_to links_path
    elsif @vote.save
      link = Link.find(params[:link_id])
      votes_updated = link.votes_count += 1
      link.update_column(:votes_count, votes_updated)
      flash[:notice] = "Your vote was tallied."
      redirect_to links_path
    else
      flash[:notice] = "Something bad happened."
      redirect_to links_path
    end

  end

  def show
  end
end
