class DepartmentsController < ApplicationController
  def new
    
  end

  def create
    @department = Department.new(
      name: params[:department_name],
      user_id: current_user.id
      )
    if @department.save
      flash[:success] = "Department Created"
      redirect_to "/courses"
    end
  end

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find_by(id:params[:id])
  end

  def update
    @room = Department.find_by(id: params[:id])
    @room.update(
      name: params[:department_name]
      )
    redirect_to "/departments"
  end

  def destroy
    department = Department.find_by(id:params[:id])
    department.delete
    course_dep = CourseDepartment.find_by(department_id: department.id)
    if course_dep
      course_dep.delete
    end
    redirect_to "/departments"
  end
end
