class StudentsController < ApplicationController  
  before_action :set_student, only: [:show, :edit, :update, :destroy]  
  
  def index
    @students = Student.all    
  end
  
  def show
  end
  
  def new
    @student = Student.new
  end
  
  def edit
  end
  
  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:info] = 'Student was successfully created.'
      redirect_to @student
      else
      render :new
    end
  end
  
  def update    
    if @student.update(student_params)
      flash[:info] = 'Student was successfully updated.'
      redirect_to @student
    else
      render :edit
    end    
  end
  
  def destroy
    @student.destroy
    flash[:info] = 'Student was successfully destroyed.'
    redirect_to students_url
  end

  private
    
    def set_student
      @student = Student.find(params[:id])
    end

    
    def student_params
      params.require(:student).permit(:name, :register_number)
    end
end
