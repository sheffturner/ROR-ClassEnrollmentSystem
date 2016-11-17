class StudentEnrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

 accepts_nested_attributes_for :course
end
