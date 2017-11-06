class User < ActiveRecord::Base
  has_one :mentor
  has_one :mentee
  has_many :resources
  has_many :posts
  has_many :post_threads, through: :posts
  has_many :messages
  has_many :student_group_associations
  has_many :student_groups, through: :student_group_associations
end
