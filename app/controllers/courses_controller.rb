class CoursesController < ApplicationController

  def index
    @departments = Department.all
    @courses = Course.all
    
    user = User.find_by(id:session[:user_id])
    @user = user
    render :index
  end

  def show
    @course = Course.find_by(id:params[:id])
    coursedep = CourseDepartment.find_by(course_id:@course.id)
    @department = Department.find_by(id:coursedep.department_id)
    render :show
  end

end
