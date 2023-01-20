class CoursesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_name: params.dig(:course, :course_name))
    redirect_to courses_path
  end

  def destroy
    @course = Course.find(params[:id])
    @course.delete
    redirect_to courses_path
  end

  def create
    @course = Course.create(course_name: params.dig(:course, :course_name))
    redirect_to courses_path
  end
end
