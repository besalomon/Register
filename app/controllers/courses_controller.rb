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

  def edit
    @categories = Department.all
    @course = Course.find_by(id: params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    s_date = params[:start_date]
    e_date = params[:end_date]
    dep = params[:department_id]

    if dep
      @dep = dep
    else
      @dep = @course.departments.first.id
    end
 
    if s_date
      @s_date = s_date
    else
      @s_date = @course.start_date
    end

    if e_date
      @e_date = e_date
    else
      @e_date = @course.end_date
    end

    @course.update(
      name: params[:long_name],
      user_id: current_user.id,
      max_number: params[:max_number],
      min_number: params[:min_number],
      series: "false",
      start_date: @s_date,
      end_date: @e_date,
      cover: params[:cover],
      long_description: params[:long_description],
      short_description: params[:short_description],
      short_name: params[:short_name]
      )
    @coursedep = CourseDepartment.find_by(course_id: @course.id)
    @coursedep.update(
      department_id: @dep
      )
    redirect_to "/courses/#{@course.id}"
  end

  def show
    @course = Course.find_by(id:params[:id])
    coursedep = CourseDepartment.find_by(course_id:@course.id)
    @department = Department.find_by(id:coursedep.department_id)
    course = StudentCourse.where("status_id=? AND course_id =?", 2, params[:id])
    @number = course.length
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

    def destroy
    course = Course.find_by(id:params[:id])
    course.delete
    student_course = StudentCourse.where(course_id: course.id)
    teacher_course = TeacherCourse.where(course_id: course.id)
    course_deparment = CourseDepartment.where(course_id: course.id)
    course_room = CourseRoom.where(course_id: course.id)
    if student_course
      student_course.delete
    end

    if course_dep
      teacher_course.delete
    end

    if course_room
      course_room.delete
    end

    if course_deparment
      course_department.delete
    end
    redirect_to "/courses"
  end

  def registration
    course = Course.find_by(id: params[:id])
    if current_user.role.name == "student"
      student = Student.find_by(user_id: current_user.id)
      check_roster = StudentCourse.find_by("student_id =? AND course_id =?", current_user.student.id, params[:id])
      student_number = student.id
      if check_roster
        flash[:warning] = "You are already enrolled in that course"
        redirect_to "/courses"
      else
        @registration = StudentCourse.new(
          student_id: student_number,
          course_id: course.id,
          status_id: 1
          )
        if @registration.save
          flash[:success] = "Registration Successful"
          redirect_to"/courses"
        end
      end
    elsif current_user.role.name == "teacher"

      teacher = Teacher.find_by(user_id: current_user.id)
      teacher_id = teacher.id
      check_roster = TeacherCourse.where("teacher_id =? AND course_id =?", current_user.teacher.id, params[:id])
      if check_roster
        flash[:warning] = "You are already registered in that course"
        redirect_to "/courses"
      else

        @registration = TeacherCourse.new(
          teacher_id: teacher.id,
          course_id: course.id,
          )
        if @registration.save
          flash[:success] = "Registration Successful"
        end
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
      @record = StudentCourse.find_by(id:hash[:id])
      if @record.update(
          status_id: hash[:status]
          )
      RegistrationMailer.registration_confirmation(@record).deliver_now
      end
    end
  redirect_to :back
  end

end