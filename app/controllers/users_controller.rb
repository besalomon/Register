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
    @registrations = StudentCourse.where("student_id =? AND status_id !=?", current_user.student.id, 3)

    elsif current_user.role.name == "teacher"
      teacher = Teacher.find_by(user_id: current_user.id)
      @registrations = TeacherCourse.where(teacher_id: teacher.id)
    end

    if params[:sort]
      @registrations = StudentCourse.where("student_id =? AND status_id !=?", current_user.student.id, 3).order(status_id: :asc)
    end

  end

  def settings
    
  end

  def profile
    
  end

  def edit
    @roles = Role.all
  end

  def update
    @user = User.find_by(id: current_user.id)
    if params[:date]
      dob = params[:date]
    else
      dob = current_user.birthdate
    end
    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      photo: params[:photo],
      phone_number: params[:phone],
      birthdate: dob,
      bio: params[:bio]
      )

    if current_user.role.name == "student"
        student = Student.find_by(user_id: current_user.id)
          student.update(
          class_level: params[:class_level]
          )
      elsif current.role.name == "teacher"
        teacher = Teacher.find_by(user_id: current_user.id)
        teacher.update(
          title: params[:job_title]
          )
      end
    redirect_to "/profile"

  end

end