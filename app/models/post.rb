class Post < ActiveRecord::Base
  #relationships
  belongs_to :user
  belongs_to :post_thread
end
