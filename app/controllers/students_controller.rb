class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :load_student, only: [:remove_course, :show_courses, :current_courses, :assign_courses]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(name: params.dig(:student, :name), email: params.dig(:student, :email))
    redirect_to root_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(name: params.dig(:student, :name), email: params.dig(:student, :email))
    redirect_to students_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  def show_courses
    @courses = @student.courses
  end

  def current_courses
    @courses = Course.all
  end

  def assign_courses
    @course = Course.find(params.dig(:course, :course_id))
    @grade = Grade.create(student_id: @student.id, course_id: @course.id)
    @student.courses << @course if @student.courses.where(id: @course.id).size == 0
    @student.grades << @grade
    @course.students << @student if @course.students.where(id: @student.id).size == 0
    redirect_to student_courses_path(@student.id)
  end

  def remove_course
    @course = Course.find(params[:course_id])
    @student.courses.delete(@course)
    @student.grades.where(course_id: @course.id).delete_all
    redirect_to student_courses_path(@student.id)
  end

  def show_grades
  end

  private

  def load_student
    @student = Student.find(params[:student_id])
  end
end
