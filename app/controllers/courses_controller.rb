class CoursesController < ApplicationController

  def index
    if params[:find]
      @courses = Course.where("name LIKE ?", "%#{params[:find]}%" || "%#{params[:find]}%")
    else
      
      @courses = Course.all
      @departments = Department.all
      user = User.find_by(id:session[:user_id])
      @user = user
      params[:find] = ""
      render :index
    end

  end

  def show
    @course = Course.find_by(id:params[:id])
    coursedep = CourseDepartment.find_by(course_id:@course.id)
    @department = Department.find_by(id:coursedep.department_id)
    render :show
  end

  def new
    @categories = Department.all
    render:new
  end

  def create
    @course = Course.new(
      name: params[:long_name],
      user_id: current_user.id,
      max_number: params[:max_number],
      min_number: params[:min_number],
      series: "false",
      start_date: params[:start_date],
      end_date: params[:end_date],
      cover: params[:cover],
      long_description: params[:long_description],
      short_description: params[:short_description],
      short_name: params[:short_name]
      )
    if @course.save
    @coursedep = CourseDepartment.new(
      course_id: @course.id,
      department_id: params[:department_id]
      )
    @coursedep.save
  else
    flash[:warning] = "Make sure all the fields are not empty"
  end

  end

end
