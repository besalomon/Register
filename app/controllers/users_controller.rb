class UsersController < ApplicationController
  def new
    @roles = Role.all
    render :new
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      role_id: params[:role_id],
      email_address: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      photo: params[:photo],
      phone_number: params[:phone],
      birthdate: params[:date],
      bio: params[:bio]
      )
    if user.save
      if user.role_id == "teacher"
        Student.create(
          user_id: user.id,
          class_level: params[:class_level]
          )
      elsif user.role == "student"
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