class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
  end
  def show
    puts "======params=====#{params.inspect}====================="
    @student=Student.find(params[:id])
  end
  def create
    puts "======params=====#{params.inspect}====================="
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render :new
    end

  end
  def edit
    puts "======params=====#{params.inspect}====================="
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @student=Student.find(params[:id])
    @student.destroy
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :roll_no)
  end

end
