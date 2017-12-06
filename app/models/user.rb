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
  
  #callbacks
  after_create :generate_match

  STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']].freeze

  STUDENT_GROUPS_LIST = ['Fraternity/Sorority','Gaming', 'Gender/LGBT', 'General Interest & Involvement', 'Media & Publications', 'Multicultural', 'Performance/Artistic', 'Political/Activism', 'Professional/Academic', 'Religious/Spiritual', 'Service/Philanthropy', 'Sports/Martial Arts', 'Student Government', 'Technology', 'Varsity Sports', 'Other']
    
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
              
  
              
              
  def group_rank
    industry_group = Mentor.all.select {|n| n if n.industry == self.mentee.preferred_industry}
    state_group = Mentor.all.select {|n| n if User.find(n.user_id).home_state == self.home_state}
    major_group = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
    student_group = Mentor.all.select {|n| n if User.find(n.user_id).student_group_category == self.student_group_category}
    work_location_group = Mentor.all.select {|n| n if User.find(n.user_id).work_location == self.work_location}
    #Industry
    if self.mentee.industry_preference == 1
      group1 = industry_group
    elsif self.mentee.industry_preference == 2
      group2 = industry_group
    elsif self.mentee.industry_preference == 3
      group3 = industry_group
    elsif self.mentee.industry_preference == 4
      group4 = industry_group
    elsif self.mentee.industry_preference == 5
      group5 = industry_group
    end
    #Major
    if self.mentee.major_preference == 1
      group1 = major_group
    elsif self.mentee.major_preference == 2
      group2 = major_group
    elsif self.mentee.major_preference == 3
      group3 = major_group
    elsif self.mentee.major_preference == 4
      group4 = major_group
    elsif self.mentee.major_preference == 5
      group5 = major_group
    end
    #State
    if self.mentee.home_state_preference == 1
      group1 = state_group
    elsif self.mentee.home_state_preference == 2
      group2 = state_group
    elsif self.mentee.home_state_preference == 3
      group3 = state_group
    elsif self.mentee.home_state_preference == 4
      group4 = state_group
    elsif self.mentee.home_state_preference == 5
      group5 = state_group
    end
    #student_group
    if self.mentee.student_group_preference == 1
      group1 = student_group
    elsif self.mentee.student_group_preference == 2
      group2 = student_group
    elsif self.mentee.student_group_preference == 3
      group3 = student_group
    elsif self.mentee.student_group_preference == 4
      group4 = student_group
    elsif self.mentee.student_group_preference == 5
      group5 = student_group
    end
    #work_location
    if self.mentee.work_location_preference == 1
      group1 = work_location_group
    elsif self.mentee.work_location_preference == 2
      group2 = work_location_group
    elsif self.mentee.work_location_preference == 3
      group3 = work_location_group
    elsif self.mentee.work_location_preference == 4
      group4 = work_location_group
    elsif self.mentee.work_location_preference == 5
      group5 = work_location_group
    end
    if group1.nil?
      group1 = []
    end
    if group2.nil?
      group2 = []
    end
    if group3.nil?
      group3 = []
    end
    if group4.nil?
      group4 = []
    end
    if group5.nil?
      group5 = []
    end
    match_helper(group1, group2, group3, group4, group5)
  end
  
  def match_helper(group1, group2, group3, group4, group5)
    level1 = find_intersection(group1, group2)
    level2 = find_intersection(level1, group3)
    level3 = find_intersection(level2, group4)
    level4 = find_intersection(level3, group5)
  end
  
  def find_intersection(first_group, second_group)
    if first_group.empty? && second_group.empty?
      return []
    elsif first_group.empty?
      return second_group
    elsif second_group.empty?
      return first_group
    else
      final_group = first_group & second_group
    end
    if final_group.empty?
      return first_group
    else 
      return final_group
    end
  end
  
  def generate_match
    if self.user_type == 'Mentee'
      match_group = group_rank
      if match_group.empty?
        mentor_match = Mentor.all.last
        new_match = Match.new
        new_match.mentor_id = mentor_match.id
        new_match.mentee_id = self.mentee.id
        new_match.active = true
        new_match.group_id = 1
        new_match.save!
      else
        mentor_match = match_group.first
        new_match = Match.new
        new_match.mentor_id = mentor_match.id
        new_match.mentee_id = self.mentee.id
        new_match.active = true
        new_match.group_id = 1
        new_match.save!
      end
        
    end
  end
  

    
  #
  # def generate_match
  #   if self.mentee.industry_preference == 1
  #     group1 = Mentor.all.select {|n| n if n.industry == self.mentee.preferred_industry}
  #     #check group1 empty
  #     if group1.empty?
  #       if self.mentee.home_state_preference == 2
  #         group2 = Mentor.all.select {|n| n if User.find(n.user_id).home_state == self.home_state}
  #         #check group2 empty
  #         if group2.empty?
  #           if self.mentee.major_preference == 3
  #             group3 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
  #           end
  #           #find mentor with least number of matches
  #           group3.first #temp
  #
  #         else
  #           if self.mentee.major_preference == 3
  #             group3 = group2.select {|n| n if User.find(n.user_id).major == self.major}
  #           end
  #           #find mentor with least number of matches
  #           group3.first #temp
  #
  #       #check preference for major
  #       if self.mentee.major_preference == 2
  #         group2 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
  #         #check group2 empty
  #         if group2.empty?
  #           if self.mentee.home_state_preference == 3
  #             group3 = group2.select {|n| n if User.find(n.user_id).home_state == self.home_state}
  #           end
  #
  #     else
  #       if self.mentee.home_state_preference == 2
  #         group2 = group1.select {|n| n if User.find(n.user_id).home_state == self.home_state}
  #         if self.mentee.major_preference == 3
  #           group3 = group2.select {|n| n if User.find(n.user_id).major == self.major}
  #         end
  #         #find mentor with least number of matches
  #         group3.first #temp
  #       if self.mentee.major_preference == 2
  #         group2 = group1.select {|n| n if User.find(n.user_id).major == self.major}
  #         if self.mentee.home_state_preference == 3
  #           group3 = group2.select {|n| n if User.find(n.user_id).home_state == self.home_state}
  #         end
  #         #find mentor with least number of matches
  #         group3.first
  #       end
  #     end
  #     if self.mentee.major_preference == 2
  #       group2 = group1.select {|n| n if User.find(n.user_id).major == self.major}
  #     end
  #   end
  #   if self.mentee.home_state_preference == 1
  #     group1 = Mentor.all.select {|n| n if User.find(n.user_id).home_state == self.home_state}
  #   end
  #   if self.mentee.major_preference == 1
  #     group1 = Mentor.all.select {|n| n if User.find(n.user_id).major == self.major}
  #   end
  # end
  
  #allow mentee creation within user
  accepts_nested_attributes_for :mentee, reject_if: lambda { |mentee| mentee[:expected_graduation].blank? }, allow_destroy: true
  #allow mentor creation within user
  accepts_nested_attributes_for :mentor, reject_if: lambda { |mentor| mentor[:graduation].blank? }, allow_destroy: true
end

