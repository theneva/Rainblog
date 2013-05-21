class Post < ActiveRecord::Base
	belongs_to :user
  	attr_accessible :content, :published, :title

  	# TODO separate between published and private posts

  	# Shouldn't hard code 5 here, but it has to go _somewhere_
  	scope :recent, lambda { |user_id| where('user_id = ?', user_id).order('created_at DESC').limit(5) }
end
