class CoursesController < ApplicationController

  def index
    if params[:find]
      @courses = Course.where("name LIKE ?", "%#{params[:find]}%" || "%#{params[:find]}%")
    else
      params[:find] = ""
      @courses = Course.all
      @departments = Department.all
      user = User.find_by(id:session[:user_id])
      @user = user
      
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

  def registration
    course = Course.find_by(id: params[:id])
    if current_user.role.name == "student"
      student = Student.find_by(user_id: current_user.id)
      student_number = student.id
      @registration = StudentCourse.new(
        student_id: student_number,
        course_id: course.id,
        status_id: 1
        )
      if @registration.save
        flash[:success] = "Registration Successful"
        redirect_to"/courses"
      end
    elsif current_user.role.name == "teacher"
      teacher = Teacher.find_by(user_id: current_user.id)
      teacher_id = teacher.id
      @registration = TeacherCourse.new(
        teacher_id: teacher.id,
        course_id: course.id,
        )
      if @registration.save
        flash[:success] = "Registration Successful"
      end
    end
  end

  def rosters
    @statuses = []
    @stat = Status.all
    statuses = Status.all
    statuses.each do |status|
      @statuses << status.name
    end
    if current_user.role.name == "admin"
      @registrations = TeacherCourse.all
      @studentcourses = StudentCourse.where(course_id: params[:course_id])
      course_name = @studentcourses.first
      if course_name
        @course_name = course_name.course.name
        @arr = []
        @var = params[:id]
      end
    else
      teacher = Teacher.find_by(user_id: current_user.id)
      @registrations = TeacherCourse.where(teacher_id: teacher.id)
      @studentcourses = StudentCourse.where(course_id: params[:course_id])
      course_name = @studentcourses.first
      if course_name
        @course_name = course_name.course.name
        @arr = []
        @var = params[:id]
      end
    end
  end

  def update_roster
    @studentroster = StudentCourse.where(course_id: params[:course_id])
    status_hash = params[:reg_info]
    status_hash.each do |hash|
      record = StudentCourse.find_by(id:hash[:id])
      record.update(
        status_id: hash[:status]
        )
    end

  end

end