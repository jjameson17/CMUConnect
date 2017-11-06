class PostThread < ActiveRecord::Base
  #relationships
  belongs_to :post
  belongs_to :user, through: :post
end
