class Brohoof < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  attr_accessible :title, :body
end
