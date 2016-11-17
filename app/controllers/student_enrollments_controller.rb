class StudentEnrollmentsController < ApplicationController
  
  def index
    @studentenrollment= StudentEnrollment.all
  end
  
  def classregis
    @studentenrollment = StudentEnrollment.new
  end
  
  def create
    @studentenrollment = StudentEnrollment.new(student_enrollment_params)

    respond_to do |format|
      if @studentenrollment.save
        format.html { redirect_to love_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @studentenrollment }
      else
        format.html { render :new }
        format.json { render json: @studentenrollment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def student_enrollment_params
    params.require(:student_enrollment).permit(:user_id, :course_id)
  end
end
