class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy # TODO ?

	# Rails 3.1 <3
	has_secure_password

	# Don't want no trouble with mass assignment
  	attr_accessible :username, :password, :password_confirmation, :email, :first_name, :last_name

  	# Validation
		# Regex borrowed from http://www.regular-expressions.info/email.html
  	email_regex =  /[a-z0-9!#$\%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$\%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/

	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 1..25 }
	validates_presence_of :password, on: :create
	validates_length_of :password, minimum: 5
	validates :email, presence: true, uniqueness: true, format: { with: email_regex }
	validates_presence_of :first_name
	validates_presence_of :last_name
	
end
