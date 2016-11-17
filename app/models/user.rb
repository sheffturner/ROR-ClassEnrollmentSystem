class User < ActiveRecord::Base
  has_many :courses, :through => :enrollments
  has_many :enrollments
  
  accepts_nested_attributes_for :courses
  
  has_secure_password
  
  #validations for sign up form
  validates :first_name,
            presence: true
            
  validates :last_name,
            presence: true
            
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  validates :major,
            presence: true
            
  def to_s
    "{first_name} {last_name}"
  end
  
 
  
end
