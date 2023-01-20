class GradesController < ApplicationController
  before_action :load_entities
  before_action :load_grade, only: :update

  def show
  end

  def edit
  end

  def update
    @grade = fill_grade_quarters(@grade, params.dig(:grade))
    @grade.total = total_of_quarters(@grade)
    @grade.passed = (@grade.total.to_f > 5.5) 
    @grade.save!
    redirect_to grade_path(@grade.id)
  end

  def destroy
  end

  private

  def fill_grade_quarters(grade, params)
    4.times do |t|
      quarter = "quarter_#{ (t+1).humanize }"

      grade.send(:"#{quarter}=",params[:"#{quarter}"]) unless params[:"#{quarter}"].empty?
    end

    grade
  end
  
  def total_of_quarters(grade)
    sum = 0
    4.times do |t|
      quarter = "quarter_#{ (t+1).humanize }"
      sum += grade.send(quarter).to_f
    end

    (sum/4).to_f.round(2)
  end

  def load_entities
    load_grade
    load_student
    load_course
  end

  def load_grade
    @grade = Grade.find(params[:id])
  end

  def load_student
    @student = Student.find(@grade.student_id)
  end

  def load_course
    @course = Course.find(@grade.course_id)
  end
end