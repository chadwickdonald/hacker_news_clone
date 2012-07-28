class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable
  attr_accessible :description, :url, :id, :user_id, :created_at, :votes

  validates_uniqueness_of :url
  validate :url, :format => {:with => /(http:\/\/|https:\/\/)/}

end

