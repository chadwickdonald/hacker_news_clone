class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :votes_count
  belongs_to :user
  has_many :votes, :as => :votable
end
