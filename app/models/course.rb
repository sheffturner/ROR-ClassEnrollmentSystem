class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, :through => :enrollments
  
   accepts_nested_attributes_for :users
   

end
