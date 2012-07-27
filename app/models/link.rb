class Link < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :url, :id, :user_id

  validates_uniqueness_of :url
  validate :url, :format => {:with => /(http:\/\/|https:\/\/)/}

end

