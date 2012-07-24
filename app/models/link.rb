class Link < ActiveRecord::Base
  attr_accessible :description, :url

  validates_uniqueness_of :url

end
