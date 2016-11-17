class StudentcoursesController < ApplicationController
   before_filter :authorizeadmin, only: [:studentnamein, :coursesout]
    before_filter :set_cache_buster

  def studentnamein
    
  end
  
  def coursesout
    first_name = params[:student_name_in]
    last_name = params[:last]
    r = User.find_by_first_name_and_last_name(first_name, last_name)
    @student_name= first_name + " " + last_name
    @course_list = r.courses
  end
end
