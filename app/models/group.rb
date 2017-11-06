class Group < ActiveRecord::Base
  #relationships
  has_many :matches
  has_many :mentors, through: :matches
  has_many :mentees, through: :matches
end
