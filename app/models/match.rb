class Match < ActiveRecord::Base
  include SessionsHelper
  #relationpships
  belongs_to :mentor
  has_one :mentee
  belongs_to :group
  
  def generate_match
    puts "current_user"
  end
end
