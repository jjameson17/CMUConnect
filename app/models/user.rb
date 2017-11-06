class User < ActiveRecord::Base
  has_one :mentor
  has_one :mentee
  has_many :resources
  has_many :posts
  has_many :post_threads, through: :posts
  has_many :messages
  has_many :student_group_associations
  has_many :student_groups, through: :student_group_associations
  
  #allow mentee creation within user
  accepts_nested_attributes_for :mentee, reject_if: lambda { |mentee| mentee[:expected_graduation].blank? }, allow_destroy: true
  #allow mentor creation within user
  accepts_nested_attributes_for :mentor, reject_if: lambda { |mentor| mentor[:graduation].blank? }, allow_destroy: true
end
