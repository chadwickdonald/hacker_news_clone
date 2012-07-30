class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :votes_count, :commentable_type, :commentable_id
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :votes, :as => :votable
end
