class EnrollmentsController < ApplicationController
  def index
    @enrollment = Enrollment.all
  end
  
  
  def classregis
    @enrollment = Enrollment.new
  end
  
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to love_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def enrollment_params
    params.require(:enrollments).permit(:user_id, :course_id)
  end
end
