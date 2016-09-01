class EnrollmentsController < ApplicationController
  def new    
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new enrollment_params
    

    if @enrollment.save
      flash[:info] = 'Enrollment was successfully created.'
      redirect_to root_path
    else      
      render :new
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id, :entry_at)
  end
end
