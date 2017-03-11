class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    var = 4
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      role_id: var,
      email_address: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      photo: params[:photo],
      phone_number: params[:phone],
      birthdate: params[:date],
      bio: params[:bio]
      )
    if user.save
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

  end

end