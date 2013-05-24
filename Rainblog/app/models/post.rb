class Post < ActiveRecord::Base
	belongs_to :user
  	attr_accessible :content, :published, :title

	validates_presence_of :title
	validates_presence_of :content

  	scope :available, lambda { |current_user_id| where('published = ? OR user_id = ?', true, current_user_id).order 'created_at DESC' }
	scope :available_by_user, lambda { |user_id, current_user_id| available(current_user_id).where('user_id = ?', user_id) }
	scope :recent_by_user, lambda { |user_id, current_user_id, limit| available_by_user(user_id, current_user_id).limit limit }
end
