class Match < ActiveRecord::Base
  #relationpships
  belongs_to :mentor
  belongs_to :mentee
  belongs_to :group
end
