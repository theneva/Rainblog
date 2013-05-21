module PostsHelper
  	def recent_posts user_id
  		@recent_posts = Post.recent user_id
  	end
end
