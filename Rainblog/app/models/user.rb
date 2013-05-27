class User < ActiveRecord::Base

	# Rails 3.1 <3
	has_secure_password

	# Don't want no trouble with mass assignment; whitelist
  	attr_accessible :username, :password, :password_confirmation, :email, :first_name, :last_name

  	# Validation; everything present, some other requirements
		# Regex borrowed without asking from http://www.regular-expressions.info/email.html
  	email_regex = /[a-z0-9!#$\%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$\%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/

	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1..25 }
	validates_length_of :password, minimum: 5
	validates :email, uniqueness: true, format: { with: email_regex }
	validates_presence_of :email, :first_name, :last_name

	# Order is key here; destroying the posts before finding comments and brohooves => disaster
	
	# When the user's posts are commented on; these comments must be destroyed
	has_many :comments, through: :posts, dependent: :destroy

	# When the user's post is brohoofed
	has_many :brohooves, through: :posts, dependent: :destroy

	# The user's posts
	has_many :posts, dependent: :destroy # TODO ?
	
	# When the user comments on posts
	has_many :comments, dependent: :destroy
end
