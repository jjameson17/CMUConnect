class User < ActiveRecord::Base
  has_one :mentor
  has_one :mentee
  has_many :resources
  has_many :posts
  has_many :post_threads, through: :posts
  has_many :messages
  has_many :student_group_associations
  has_many :student_groups, through: :student_group_associations
  has_secure_password
  
  def create_group(mentor_group, preference_rank, criteria)
    if criteria == 
    mentor_group.select {|n| n if n.criteria}
    
    #pref = 1
    #group mentors with matching criteria - group1
      #if group1 is empty
        # find pref2
        # group mentors with matching criteria - group2
          #check group2 empty 
            #find pref3
            #group mentors with matching criteria - group3
              #group3.first
          #else group2 not empty
            #find pref 3
            #group mentors with matching criteria - group3
              #group3.first
      #else group1 not empty
        # find pref2
        # group mentors with matching criteria - group2
          #check group2 empty 
            #find pref3
            #group mentors with matching criteria - group3
              #group3.first
          #else group2 not empty
            #find pref 3
            #group mentors with matching criteria - group3
              #group3.first
        
    
  
  def generate_match
    if self.mentee.industry_preference == 1
      group1 = Mentor.all.select {|n| n if n.industry == self.mentee.preferred_industry}
      #check group1 empty
      if group1.empty?
        if self.mentee.home_state_preference == 2
          group2 = Mentor.all.select {|n| n if User.find(n.user_id).home_state == self.home_state}
          #check group2 empty
          if group2.empty?
            if self.mentee.major_preference == 3
              group3 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
            end
            #find mentor with least number of matches
            group3.first #temp
          if self.mentee.major_preference == 2
            group2 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
            if self.mentee.home_state_preference == 3
              group3 = group2.select {|n| n if User.find(n.user_id).home_state == self.home_state}
            end
            #find mentor with least number of matches
            group3.first
          else
            if self.mentee.major_preference == 3
              group3 = group2.select {|n| n if User.find(n.user_id).major == self.major}
            end
            #find mentor with least number of matches
            group3.first #temp
          if self.mentee.major_preference == 2
            group2 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
            if self.mentee.home_state_preference == 3
              group3 = group2.select {|n| n if User.find(n.user_id).home_state == self.home_state}
            end
            #find mentor with least number of matches
            group3.first
        
      else
        if self.mentee.home_state_preference == 2
          group2 = group1.select {|n| n if User.find(n.user_id).home_state == self.home_state}
          if self.mentee.major_preference == 3
            group3 = group2.select {|n| n if User.find(n.user_id).major == self.major}
          end
          #find mentor with least number of matches
          group3.first #temp
        if self.mentee.major_preference == 2
          group2 = group1.select {|n| n if User.find(n.user_id).major == self.major}
          if self.mentee.home_state_preference == 3
            group3 = group2.select {|n| n if User.find(n.user_id).home_state == self.home_state}
          end
          #find mentor with least number of matches
          group3.first
        end
      end
      if self.mentee.major_preference == 2
        group2 = group1.select {|n| n if User.find(n.user_id).major == self.major}
      end  
    end
    if self.mentee.home_state_preference == 1
      group1 = Mentor.all.select {|n| n if User.find(n.user_id).home_state == self.home_state}
    end
    if self.mentee.major_preference == 1
      group1 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
    end
  end
  
  #allow mentee creation within user
  accepts_nested_attributes_for :mentee, reject_if: lambda { |mentee| mentee[:expected_graduation].blank? }, allow_destroy: true
  #allow mentor creation within user
  accepts_nested_attributes_for :mentor, reject_if: lambda { |mentor| mentor[:graduation].blank? }, allow_destroy: true
end

