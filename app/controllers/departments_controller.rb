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
end
