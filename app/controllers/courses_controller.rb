class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    @courses = Course.all
  end
  
  def show
  end
  
  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    
    if @course.save
      flash[:info] = 'Course was successfully created.'
      redirect_to @course
    else
      render :new
    end    
  end
  
  def update
    if @course.update(course_params)
      flash[:info] = 'Course was successfully updated.'
      redirect_to @course
    else
      render :edit
    end    
  end

  def destroy
    @course.destroy
    flash[:info] = 'Course was successfully destroyed.'
    redirect_to courses_url
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description)
    end
end
