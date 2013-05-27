class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  attr_accessible :content

  validates_presence_of :content

  # Convenience
  def author_name
	User.find(self.user_id).username
  end
end
