class Mentor < ActiveRecord::Base
  has_many :matches
  has_one :user
  has_many :mentees, through: :matches
  belongs_to :group, through: :match
end
