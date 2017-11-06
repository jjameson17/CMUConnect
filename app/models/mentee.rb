class Mentee < ActiveRecord::Base
  #relationships
  has_one :user
  has_one :match
  has_one :mentor, through: :match
  belongs_to :group, through: :match
  
end
