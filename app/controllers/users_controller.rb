class UsersController < ApplicationController
  def new
    @roles = Role.all
    render :new
  end

  def create
      if current_user && current_user.role.name == "admin"
       user_role = params[:role_id]
      else
       user_role = 3
      end
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email],
      role_id: user_role,
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      photo: params[:photo],
      phone_number: params[:phone],
      birthdate: params[:date],
      bio: params[:bio]
      )
    if user.save
      if user.role.name == "student"
        Student.create(
          user_id: user.id,
          class_level: params[:class_level]
          )
      elsif user.role.name == "teacher"
        Teacher.create(
          user_id: user.id,
          title: params[:job_title]
          )
      end
      session[:user_id] = user.id
      flash[:success] = "Successfully Created Account"
      redirect_to '/dashboard'
    else
      flash[:warning] = "Invalid Password or Email"
      redirect_to '/signup'
    end
  end

  def home
    if current_user.role.name == "student"
    student = Student.find_by(user_id: current_user.id)
    @registrations = StudentCourse.where(student_id: student.id)

    elsif current_user.role.name == "teacher"
      teacher = Teacher.find_by(user_id: current_user.id)
      @registrations = TeacherCourse.where(teacher_id: teacher.id)
    end

  end

  def settings
    
  end

  def profile
    
  end

end