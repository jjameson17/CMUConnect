class StudentGroup < ActiveRecord::Base
  has_many :student_group_associations
  belongs_to :user, through: :student_group_association
end
