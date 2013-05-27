class Post < ActiveRecord::Base

	belongs_to :user
  	attr_accessible :content, :published, :title

	validates_presence_of :title, :content

	has_many :comments, dependent: :destroy
	has_many :brohooves, dependent: :destroy

	def published_posts
		
	end

  	scope :available, lambda { |current_user_id| where('published = ? OR user_id = ?', true, current_user_id).order 'published_at DESC' }
	scope :available_by_user, lambda { |user_id, current_user_id| available(current_user_id).where('user_id = ?', user_id) }
end
